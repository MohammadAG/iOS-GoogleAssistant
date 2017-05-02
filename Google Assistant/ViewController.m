//
//  ViewController.m
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 29/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import "ViewController.h"

#import "google/assistant/embedded/v1alpha1/EmbeddedAssistant.pbrpc.h"

#import <RxLibrary/GRXWriter.h>
#import <GRPCClient/GRPCCall.h>
#import <RxLibrary/GRXBufferedPipe.h>
#import <ProtoRPC/ProtoRPC.h>

#import "AudioController.h"

#import <GTMAppAuthFetcherAuthorization.h>
#import <GTMAppAuthFetcherAuthorization+Keychain.h>

#import "AppDelegate.h"

#import <OIDAuthorizationRequest.h>
#import <OIDAuthState+IOS.h>
#import <OIDTokenResponse.h>
#import <OIDAuthStateChangeDelegate.h>

#import "RequestsViewController.h"

#import "GooglePlatformConstants.h"

static NSString * const kHostAddress = @"embeddedassistant.googleapis.com";
static NSString * const kGoogleKeychainName = @"GoogleOAuth2";

#define SAMPLE_RATE 16000.0f

@interface ViewController () <AudioControllerDelegate, OIDAuthStateChangeDelegate> {
    GRPCProtoCall *_call;
    BOOL _didAuthOnce;
    NSMutableData *mp3Data;
    AVAudioPlayer *_player;
    NSDate *_lastTimeWritten;
    NSTimer *_timer;
    EmbeddedAssistant *_assistant;
    UINotificationFeedbackGenerator *_notificationFeedbackGenerator;
    NSData *_lastConversationState;
    BOOL _followOnMode;
}

@property (nonatomic, strong) GRXBufferedPipe *writer;
@property(nonatomic, nullable, strong) GTMAppAuthFetcherAuthorization *authorization;
@property (weak) RequestsViewController *requestsViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _notificationFeedbackGenerator = [[UINotificationFeedbackGenerator alloc] init];
    
    [AudioController sharedInstance].delegate = self;
    [[AudioController sharedInstance] prepareWithSampleRate:SAMPLE_RATE];
    [[AudioController sharedInstance] stop];
    
    _assistant = [EmbeddedAssistant serviceWithHost:kHostAddress];
    
    mp3Data = [[NSMutableData alloc] init];
}

- (void)authorizeWithGoogle:(BOOL)skipCache {
    if (!skipCache) {
        _authorization = [GTMAppAuthFetcherAuthorization authorizationFromKeychainForName:kGoogleKeychainName];
        if (_authorization) {
            if ([_authorization.authState.lastTokenResponse.accessTokenExpirationDate timeIntervalSinceNow] < 0) {
                NSLog(@"Token expired");
            }
            _authorization.authState.stateChangeDelegate = self;
            return;
        }
    }
    
    NSURL *redirectURI = [NSURL URLWithString:[kRedirectURL stringByAppendingString:@"://"]];
    OIDServiceConfiguration *configuration = [GTMAppAuthFetcherAuthorization configurationForGoogle];
    OIDAuthorizationRequest *request = [[OIDAuthorizationRequest alloc] initWithConfiguration:configuration clientId:kClientID clientSecret:nil scopes:@[@"https://www.googleapis.com/auth/assistant-sdk-prototype"] redirectURL:redirectURI responseType:OIDResponseTypeCode additionalParameters:nil];
    
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    appDelegate.currentAuthorizationFlow = [OIDAuthState authStateByPresentingAuthorizationRequest:request presentingViewController:self callback:^(OIDAuthState * _Nullable authState, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        if (authState) {
            GTMAppAuthFetcherAuthorization *authorization = [[GTMAppAuthFetcherAuthorization alloc] initWithAuthState:authState];
            
            self.authorization = authorization;
            authorization.authState.stateChangeDelegate = self;
            [GTMAppAuthFetcherAuthorization saveAuthorization:_authorization
                                            toKeychainForName:kGoogleKeychainName];
            NSLog(@"Got authorization tokens. Access token: %@",
                  authState.lastTokenResponse.accessToken);
            
            [self startClientWithToken:authState.lastTokenResponse.accessToken];
        } else {
            NSLog(@"Authorization error: %@", [error localizedDescription]);
            self.authorization = nil;
        }
    }];
}

- (void)startClientWithToken:(NSString *)token {
    _writer = [[GRXBufferedPipe alloc] init];
    
    ConverseRequest *converseRequest = [ConverseRequest message];
    converseRequest.config.audioInConfig.encoding = AudioInConfig_Encoding_Linear16;
    converseRequest.config.audioInConfig.sampleRateHertz = SAMPLE_RATE;
    converseRequest.config.audioOutConfig.encoding = AudioOutConfig_Encoding_Mp3;
    converseRequest.config.audioOutConfig.sampleRateHertz = 24000;
    converseRequest.config.audioOutConfig.volumePercentage = 100;
    converseRequest.config.converseState.conversationState = _lastConversationState;
    
    _call = [_assistant RPCToConverseWithRequestsWriter:_writer eventHandler:^(BOOL done, ConverseResponse * _Nullable response, NSError * _Nullable error) {
        
        _call = nil;
        if (done) {
            NSLog(@"RPC call done");
        }
        if (error) {
            [_notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeError];
            NSLog(@"Error occured: %@", error);
            if (error.code == 16) {
                [self authorizeWithGoogle:YES];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                _interactionView.interactionState = Idle;
            });
            return;
        }
        
        if (response.converseResponseOneOfCase != 3)
            NSLog(@"Got response: %@", response);
        if (response.converseResponseOneOfCase == ConverseResponse_ConverseResponse_OneOfCase_EventType && response.eventType == ConverseResponse_EventType_EndOfUtterance) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self stopRecording];
                _interactionView.interactionState = Thinking;
                [_notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeSuccess];
            });
        } else if (response.converseResponseOneOfCase == ConverseResponse_ConverseResponse_OneOfCase_AudioOut) {
            [mp3Data appendData:response.audioOut.audioData];
            if (_timer) {
                [_timer invalidate];
            }
            
            // Ugly hack
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(playAudio:) userInfo:nil repeats:NO];
        } else if (response.converseResponseOneOfCase == ConverseResponse_ConverseResponse_OneOfCase_Result) {
            NSLog(@"Got request: %@", response.result.spokenRequestText);
            _lastConversationState = response.result.conversationState;
            _followOnMode = response.result.microphoneMode == ConverseResult_MicrophoneMode_DialogFollowOn;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (response.result.spokenRequestText.length > 0) {
                    [_requestsViewController addMessage:response.result.spokenRequestText];
                }
            });
            if (response.result.spokenRequestText.length == 0 && !_followOnMode) {
                _interactionView.interactionState = Idle;
                [_notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeWarning];
            }
        } else {
            NSLog(@"Got other response: %@", response);
        }
    }];
    
    _call.requestHeaders[@"Authorization"] = [@"Bearer " stringByAppendingString:token];
    
    [_call start];
    
    [_writer writeValue:converseRequest];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_didAuthOnce)
        return;
    
    _didAuthOnce = YES;
    [self authorizeWithGoogle:NO];
}

- (IBAction)playAudio:(id)sender {
    if (!mp3Data)
        return;
    
    [_requestsViewController addResponseWithMP3Data:mp3Data];
    [mp3Data setLength:0];

    _interactionView.interactionState = Speaking;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (_followOnMode) {
        NSLog(@"Following on from previous request");
        [self startRecording];
    } else {
        _interactionView.interactionState = Idle;
    }
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    if (error) {
        NSLog(@"Error decoding: %@", error.localizedDescription);
    }
    
    _interactionView.interactionState = Idle;
}

- (void)startRecording {
    _interactionView.interactionState = Listening;
    
    [_notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeWarning];
    
    if (_call == nil) {
        if ([_authorization.authState.lastTokenResponse.accessTokenExpirationDate timeIntervalSinceNow] < 0) {
            [_authorization.authState setNeedsTokenRefresh];
            [_authorization.authState performActionWithFreshTokens:^(NSString * _Nullable accessToken, NSString * _Nullable idToken, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"Failed to refresh token: %@", error.localizedDescription);
                }
                
                [self startClientWithToken:accessToken];
            } additionalRefreshParameters:nil];
        } else {
            [self startClientWithToken:_authorization.authState.lastTokenResponse.accessToken];
        }
    }
    
    // Give the Taptic Engine a chance to work
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(350 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
        [[AudioController sharedInstance] start];
    });
}

- (void)stopRecording {
    [[AudioController sharedInstance] stop];
}

- (IBAction)interactionViewClicked:(UITapGestureRecognizer *)sender {
    if (_interactionView.interactionState == Idle) {
        [self startRecording];
    } else if (_interactionView.interactionState == Listening) {
        [_call cancel];
        _call = nil;
        _interactionView.interactionState = Idle;
        [self stopRecording];
    }
}

- (void)processSampleData:(NSData *)data {
    ConverseRequest *request = [ConverseRequest message];
    request.audioIn = data;
    
    [_writer writeValue:request];
}

- (void)didChangeState:(OIDAuthState *)state {
    NSLog(@"Token updated");
    [GTMAppAuthFetcherAuthorization saveAuthorization:_authorization toKeychainForName:kGoogleKeychainName];
    [self startClientWithToken:state.lastTokenResponse.accessToken];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    _requestsViewController = segue.destinationViewController;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _requestsViewController.correctLayoutGuide = self.topLayoutGuide;
}

@end
