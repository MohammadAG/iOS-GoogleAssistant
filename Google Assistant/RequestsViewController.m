//
//  RequestsViewController.m
//  Google Home
//
//  Created by Mohammad Abu-Garbeyyeh on 30/4/17.
//  Copyright © 2017 Mohammad Abu-Garbeyyeh. All rights reserved.
//

#import "RequestsViewController.h"
#import <JSQMessage.h>
#import <JSQMessagesBubbleImageFactory.h>
#import <UIColor+JSQMessages.h>
#import <JSQMessagesCollectionViewFlowLayout.h>
#import "AssistantResponseMediaItem.h"
#import "ViewController.h"

static NSString * const kMe = @"Me";
static NSString * const kGoogleId = @"GOOG";
static NSString * const kGoogleSenderName = @"Google Assistant";

@interface RequestsViewController () {
    NSMutableArray <JSQMessage *> *_messages;
    JSQMessagesBubbleImageFactory *_factory;
}

@end

@implementation RequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.senderId = kMe;
    self.senderDisplayName = kGoogleSenderName;
    self.collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero;
    self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero;
    self.inputToolbar.alpha = 0;
    self.topContentAdditionalInset = self.correctLayoutGuide.length;

    _factory = [[JSQMessagesBubbleImageFactory alloc] init];
    
    _messages = [[NSMutableArray alloc] init];

    NSNumber *didShow = [[NSUserDefaults standardUserDefaults] objectForKey:@"did_show_user_permission_warning"];
    if (!didShow.boolValue) {
        [_messages addObject:[JSQMessage messageWithSenderId:kGoogleId displayName:kGoogleSenderName text:@"Hi, I'm your Google Assistant, tap the button below to get started"]];
    
        [_messages addObject:[JSQMessage messageWithSenderId:kGoogleId displayName:kGoogleSenderName text:@"If this is your first time using Assistant, you need to enable the \"Voice & Audio Activity\" permission at https://myaccount.google.com/activitycontrols"]];
        [[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"did_show_user_permission_warning"];
    } else {
        [_messages addObject:[JSQMessage messageWithSenderId:kGoogleId displayName:kGoogleSenderName text:@"Hi, how can I help?"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = _messages[indexPath.row];
    if ([message.senderId isEqualToString:@"Me"]) {
        return [_factory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleBlueColor]];
    } else {
        return [_factory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessagesCollectionViewCell *cell = [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    JSQMessage *message = _messages[indexPath.row];
    
    if ([message.senderId isEqualToString:@"Me"]) {
        cell.textView.textColor = [UIColor whiteColor];
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                     NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    } else {
        cell.textView.textColor = [UIColor blackColor];
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : self.view.tintColor,
                                              NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    }

    return cell;
}

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _messages[indexPath.row];
}

- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _messages.count;
}

- (void)addResponseWithMP3Data:(NSData *)data {
    JSQMessage *lastMessage = _messages.lastObject;
    
    // 0.7 seconds coming back to bite me here.
    if (lastMessage.media) {
        AssistantResponseMediaItem *mediaItem = (AssistantResponseMediaItem *) lastMessage.media;
        NSMutableData *data = [NSMutableData dataWithData:mediaItem.audioData];
        [data appendData:data];
        mediaItem.audioData = data;
        return;
    }
    
    AssistantResponseMediaItem *mediaItem = [[AssistantResponseMediaItem alloc] initWithData:data];
    mediaItem.audioViewAttributes.audioCategoryOptions = AVAudioSessionCategoryOptionDefaultToSpeaker;
    
    // Eh, probably shouldn't be doing it this way
    mediaItem.avAudioPlayerDelegate = (ViewController *) self.parentViewController;
    
    JSQMessage *message = [[JSQMessage alloc] initWithSenderId:kGoogleId senderDisplayName:kGoogleSenderName date:[NSDate date] media:mediaItem];
    
    [_messages addObject:message];
    [self addNewMessage];
    [mediaItem playAudio];
}

- (void)addMessage:(NSString *)message {
    [self addMessage:message fromUser:YES];
}

- (void)addMessage:(NSString *)message fromUser:(BOOL)user {
    [_messages addObject:[[JSQMessage alloc] initWithSenderId:user ? kMe : kGoogleId senderDisplayName:user ? kMe : kGoogleSenderName date:[NSDate date] text:message]];
    
    [self addNewMessage];
}

- (void)addNewMessage {
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:_messages.count-1 inSection:0]]];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_messages.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
}

- (void)setCorrectLayoutGuide:(id<UILayoutSupport>)correctLayoutGuide {
    _correctLayoutGuide = correctLayoutGuide;
    
    self.topContentAdditionalInset = correctLayoutGuide.length;
}

@end
