#import "google/assistant/embedded/v1alpha1/EmbeddedAssistant.pbrpc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

@implementation EmbeddedAssistant

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:@"google.assistant.embedded.v1alpha1" serviceName:@"EmbeddedAssistant"]);
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}


#pragma mark Converse(stream ConverseRequest) returns (stream ConverseResponse)

/**
 * Initiates or continues a conversation with the embedded assistant service.
 * Each call performs one round-trip, sending an audio request to the service
 * and receiving the audio response. Uses bidirectional streaming to receive
 * results, such as the `END_OF_UTTERANCE` event, while sending audio.
 * 
 * A conversation is one or more gRPC connections, each consisting of several
 * streamed requests and responses.
 * For example, the user says *Add to my shopping list* and the assistant
 * responds *What do you want to add?*. The sequence of streamed requests and
 * responses in the first gRPC message could be:
 * 
 * *   ConverseRequest.config
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseResponse.event_type.END_OF_UTTERANCE
 * *   ConverseResponse.result.microphone_mode.DIALOG_FOLLOW_ON
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * 
 * The user then says *bagels* and the assistant responds
 * *OK, I've added bagels to your shopping list*. This is sent as another gRPC
 * connection call to the `Converse` method, again with streamed requests and
 * responses, such as:
 * 
 * *   ConverseRequest.config
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseResponse.event_type.END_OF_UTTERANCE
 * *   ConverseResponse.result.microphone_mode.CLOSE_MICROPHONE
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * 
 * Although the precise order of responses is not guaranteed, sequential
 * ConverseResponse.audio_out messages will always contain sequential portions
 * of audio.
 */
- (void)converseWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, ConverseResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  [[self RPCToConverseWithRequestsWriter:requestWriter eventHandler:eventHandler] start];
}
// Returns a not-yet-started RPC object.
/**
 * Initiates or continues a conversation with the embedded assistant service.
 * Each call performs one round-trip, sending an audio request to the service
 * and receiving the audio response. Uses bidirectional streaming to receive
 * results, such as the `END_OF_UTTERANCE` event, while sending audio.
 * 
 * A conversation is one or more gRPC connections, each consisting of several
 * streamed requests and responses.
 * For example, the user says *Add to my shopping list* and the assistant
 * responds *What do you want to add?*. The sequence of streamed requests and
 * responses in the first gRPC message could be:
 * 
 * *   ConverseRequest.config
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseResponse.event_type.END_OF_UTTERANCE
 * *   ConverseResponse.result.microphone_mode.DIALOG_FOLLOW_ON
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * 
 * The user then says *bagels* and the assistant responds
 * *OK, I've added bagels to your shopping list*. This is sent as another gRPC
 * connection call to the `Converse` method, again with streamed requests and
 * responses, such as:
 * 
 * *   ConverseRequest.config
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseRequest.audio_in
 * *   ConverseResponse.event_type.END_OF_UTTERANCE
 * *   ConverseResponse.result.microphone_mode.CLOSE_MICROPHONE
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * *   ConverseResponse.audio_out
 * 
 * Although the precise order of responses is not guaranteed, sequential
 * ConverseResponse.audio_out messages will always contain sequential portions
 * of audio.
 */
- (GRPCProtoCall *)RPCToConverseWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, ConverseResponse *_Nullable response, NSError *_Nullable error))eventHandler{
  return [self RPCToMethod:@"Converse"
            requestsWriter:requestWriter
             responseClass:[ConverseResponse class]
        responsesWriteable:[GRXWriteable writeableWithEventHandler:eventHandler]];
}
@end
