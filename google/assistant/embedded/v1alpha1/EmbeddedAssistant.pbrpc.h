#import "google/assistant/embedded/v1alpha1/EmbeddedAssistant.pbobjc.h"

#import <ProtoRPC/ProtoService.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>

#import "google/api/Annotations.pbobjc.h"
#import "google/rpc/Status.pbobjc.h"


NS_ASSUME_NONNULL_BEGIN

@protocol EmbeddedAssistant <NSObject>

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
- (void)converseWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, ConverseResponse *_Nullable response, NSError *_Nullable error))eventHandler;

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
- (GRPCProtoCall *)RPCToConverseWithRequestsWriter:(GRXWriter *)requestWriter eventHandler:(void(^)(BOOL done, ConverseResponse *_Nullable response, NSError *_Nullable error))eventHandler;


@end

/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface EmbeddedAssistant : GRPCProtoService<EmbeddedAssistant>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host;
@end

NS_ASSUME_NONNULL_END
