// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: google/assistant/embedded/v1alpha1/embedded_assistant.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "google/assistant/embedded/v1alpha1/EmbeddedAssistant.pbobjc.h"
 #import "google/api/Annotations.pbobjc.h"
 #import "google/rpc/Status.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"

#pragma mark - EmbeddedAssistantRoot

@implementation EmbeddedAssistantRoot

+ (GPBExtensionRegistry*)extensionRegistry {
  // This is called by +initialize so there is no need to worry
  // about thread safety and initialization of registry.
  static GPBExtensionRegistry* registry = nil;
  if (!registry) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    registry = [[GPBExtensionRegistry alloc] init];
    // Merge in the imports (direct or indirect) that defined extensions.
    [registry addExtensions:[GAPIAnnotationsRoot extensionRegistry]];
  }
  return registry;
}

@end

#pragma mark - EmbeddedAssistantRoot_FileDescriptor

static GPBFileDescriptor *EmbeddedAssistantRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"google.assistant.embedded.v1alpha1"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - ConverseConfig

@implementation ConverseConfig

@dynamic hasAudioInConfig, audioInConfig;
@dynamic hasAudioOutConfig, audioOutConfig;
@dynamic hasConverseState, converseState;

typedef struct ConverseConfig__storage_ {
  uint32_t _has_storage_[1];
  AudioInConfig *audioInConfig;
  AudioOutConfig *audioOutConfig;
  ConverseState *converseState;
} ConverseConfig__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "audioInConfig",
        .dataTypeSpecific.className = GPBStringifySymbol(AudioInConfig),
        .number = ConverseConfig_FieldNumber_AudioInConfig,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ConverseConfig__storage_, audioInConfig),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "audioOutConfig",
        .dataTypeSpecific.className = GPBStringifySymbol(AudioOutConfig),
        .number = ConverseConfig_FieldNumber_AudioOutConfig,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ConverseConfig__storage_, audioOutConfig),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "converseState",
        .dataTypeSpecific.className = GPBStringifySymbol(ConverseState),
        .number = ConverseConfig_FieldNumber_ConverseState,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(ConverseConfig__storage_, converseState),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ConverseConfig class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ConverseConfig__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - AudioInConfig

@implementation AudioInConfig

@dynamic encoding;
@dynamic sampleRateHertz;

typedef struct AudioInConfig__storage_ {
  uint32_t _has_storage_[1];
  AudioInConfig_Encoding encoding;
  int32_t sampleRateHertz;
} AudioInConfig__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "encoding",
        .dataTypeSpecific.enumDescFunc = AudioInConfig_Encoding_EnumDescriptor,
        .number = AudioInConfig_FieldNumber_Encoding,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(AudioInConfig__storage_, encoding),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "sampleRateHertz",
        .dataTypeSpecific.className = NULL,
        .number = AudioInConfig_FieldNumber_SampleRateHertz,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(AudioInConfig__storage_, sampleRateHertz),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[AudioInConfig class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(AudioInConfig__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t AudioInConfig_Encoding_RawValue(AudioInConfig *message) {
  GPBDescriptor *descriptor = [AudioInConfig descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:AudioInConfig_FieldNumber_Encoding];
  return GPBGetMessageInt32Field(message, field);
}

void SetAudioInConfig_Encoding_RawValue(AudioInConfig *message, int32_t value) {
  GPBDescriptor *descriptor = [AudioInConfig descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:AudioInConfig_FieldNumber_Encoding];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum AudioInConfig_Encoding

GPBEnumDescriptor *AudioInConfig_Encoding_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "EncodingUnspecified\000Linear16\000Flac\000";
    static const int32_t values[] = {
        AudioInConfig_Encoding_EncodingUnspecified,
        AudioInConfig_Encoding_Linear16,
        AudioInConfig_Encoding_Flac,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(AudioInConfig_Encoding)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:AudioInConfig_Encoding_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL AudioInConfig_Encoding_IsValidValue(int32_t value__) {
  switch (value__) {
    case AudioInConfig_Encoding_EncodingUnspecified:
    case AudioInConfig_Encoding_Linear16:
    case AudioInConfig_Encoding_Flac:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - AudioOutConfig

@implementation AudioOutConfig

@dynamic encoding;
@dynamic sampleRateHertz;
@dynamic volumePercentage;

typedef struct AudioOutConfig__storage_ {
  uint32_t _has_storage_[1];
  AudioOutConfig_Encoding encoding;
  int32_t sampleRateHertz;
  int32_t volumePercentage;
} AudioOutConfig__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "encoding",
        .dataTypeSpecific.enumDescFunc = AudioOutConfig_Encoding_EnumDescriptor,
        .number = AudioOutConfig_FieldNumber_Encoding,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(AudioOutConfig__storage_, encoding),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "sampleRateHertz",
        .dataTypeSpecific.className = NULL,
        .number = AudioOutConfig_FieldNumber_SampleRateHertz,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(AudioOutConfig__storage_, sampleRateHertz),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "volumePercentage",
        .dataTypeSpecific.className = NULL,
        .number = AudioOutConfig_FieldNumber_VolumePercentage,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(AudioOutConfig__storage_, volumePercentage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[AudioOutConfig class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(AudioOutConfig__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t AudioOutConfig_Encoding_RawValue(AudioOutConfig *message) {
  GPBDescriptor *descriptor = [AudioOutConfig descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:AudioOutConfig_FieldNumber_Encoding];
  return GPBGetMessageInt32Field(message, field);
}

void SetAudioOutConfig_Encoding_RawValue(AudioOutConfig *message, int32_t value) {
  GPBDescriptor *descriptor = [AudioOutConfig descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:AudioOutConfig_FieldNumber_Encoding];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum AudioOutConfig_Encoding

GPBEnumDescriptor *AudioOutConfig_Encoding_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "EncodingUnspecified\000Linear16\000Mp3\000OpusInO"
        "gg\000";
    static const int32_t values[] = {
        AudioOutConfig_Encoding_EncodingUnspecified,
        AudioOutConfig_Encoding_Linear16,
        AudioOutConfig_Encoding_Mp3,
        AudioOutConfig_Encoding_OpusInOgg,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(AudioOutConfig_Encoding)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:AudioOutConfig_Encoding_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL AudioOutConfig_Encoding_IsValidValue(int32_t value__) {
  switch (value__) {
    case AudioOutConfig_Encoding_EncodingUnspecified:
    case AudioOutConfig_Encoding_Linear16:
    case AudioOutConfig_Encoding_Mp3:
    case AudioOutConfig_Encoding_OpusInOgg:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - ConverseState

@implementation ConverseState

@dynamic conversationState;

typedef struct ConverseState__storage_ {
  uint32_t _has_storage_[1];
  NSData *conversationState;
} ConverseState__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "conversationState",
        .dataTypeSpecific.className = NULL,
        .number = ConverseState_FieldNumber_ConversationState,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ConverseState__storage_, conversationState),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ConverseState class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ConverseState__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - AudioOut

@implementation AudioOut

@dynamic audioData;

typedef struct AudioOut__storage_ {
  uint32_t _has_storage_[1];
  NSData *audioData;
} AudioOut__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "audioData",
        .dataTypeSpecific.className = NULL,
        .number = AudioOut_FieldNumber_AudioData,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(AudioOut__storage_, audioData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[AudioOut class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(AudioOut__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - ConverseResult

@implementation ConverseResult

@dynamic spokenRequestText;
@dynamic spokenResponseText;
@dynamic conversationState;
@dynamic microphoneMode;
@dynamic volumePercentage;

typedef struct ConverseResult__storage_ {
  uint32_t _has_storage_[1];
  ConverseResult_MicrophoneMode microphoneMode;
  int32_t volumePercentage;
  NSString *spokenRequestText;
  NSString *spokenResponseText;
  NSData *conversationState;
} ConverseResult__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "spokenRequestText",
        .dataTypeSpecific.className = NULL,
        .number = ConverseResult_FieldNumber_SpokenRequestText,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ConverseResult__storage_, spokenRequestText),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "spokenResponseText",
        .dataTypeSpecific.className = NULL,
        .number = ConverseResult_FieldNumber_SpokenResponseText,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ConverseResult__storage_, spokenResponseText),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "conversationState",
        .dataTypeSpecific.className = NULL,
        .number = ConverseResult_FieldNumber_ConversationState,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(ConverseResult__storage_, conversationState),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "microphoneMode",
        .dataTypeSpecific.enumDescFunc = ConverseResult_MicrophoneMode_EnumDescriptor,
        .number = ConverseResult_FieldNumber_MicrophoneMode,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(ConverseResult__storage_, microphoneMode),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "volumePercentage",
        .dataTypeSpecific.className = NULL,
        .number = ConverseResult_FieldNumber_VolumePercentage,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(ConverseResult__storage_, volumePercentage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ConverseResult class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ConverseResult__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t ConverseResult_MicrophoneMode_RawValue(ConverseResult *message) {
  GPBDescriptor *descriptor = [ConverseResult descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ConverseResult_FieldNumber_MicrophoneMode];
  return GPBGetMessageInt32Field(message, field);
}

void SetConverseResult_MicrophoneMode_RawValue(ConverseResult *message, int32_t value) {
  GPBDescriptor *descriptor = [ConverseResult descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ConverseResult_FieldNumber_MicrophoneMode];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum ConverseResult_MicrophoneMode

GPBEnumDescriptor *ConverseResult_MicrophoneMode_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "MicrophoneModeUnspecified\000CloseMicrophon"
        "e\000DialogFollowOn\000";
    static const int32_t values[] = {
        ConverseResult_MicrophoneMode_MicrophoneModeUnspecified,
        ConverseResult_MicrophoneMode_CloseMicrophone,
        ConverseResult_MicrophoneMode_DialogFollowOn,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(ConverseResult_MicrophoneMode)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:ConverseResult_MicrophoneMode_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL ConverseResult_MicrophoneMode_IsValidValue(int32_t value__) {
  switch (value__) {
    case ConverseResult_MicrophoneMode_MicrophoneModeUnspecified:
    case ConverseResult_MicrophoneMode_CloseMicrophone:
    case ConverseResult_MicrophoneMode_DialogFollowOn:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - ConverseRequest

@implementation ConverseRequest

@dynamic converseRequestOneOfCase;
@dynamic config;
@dynamic audioIn;

typedef struct ConverseRequest__storage_ {
  uint32_t _has_storage_[2];
  ConverseConfig *config;
  NSData *audioIn;
} ConverseRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "config",
        .dataTypeSpecific.className = GPBStringifySymbol(ConverseConfig),
        .number = ConverseRequest_FieldNumber_Config,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(ConverseRequest__storage_, config),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "audioIn",
        .dataTypeSpecific.className = NULL,
        .number = ConverseRequest_FieldNumber_AudioIn,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(ConverseRequest__storage_, audioIn),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ConverseRequest class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ConverseRequest__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    static const char *oneofs[] = {
      "converseRequest",
    };
    [localDescriptor setupOneofs:oneofs
                           count:(uint32_t)(sizeof(oneofs) / sizeof(char*))
                   firstHasIndex:-1];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

void ConverseRequest_ClearConverseRequestOneOfCase(ConverseRequest *message) {
  GPBDescriptor *descriptor = [message descriptor];
  GPBOneofDescriptor *oneof = [descriptor.oneofs objectAtIndex:0];
  GPBMaybeClearOneof(message, oneof, -1, 0);
}
#pragma mark - ConverseResponse

@implementation ConverseResponse

@dynamic converseResponseOneOfCase;
@dynamic error;
@dynamic eventType;
@dynamic audioOut;
@dynamic result;

typedef struct ConverseResponse__storage_ {
  uint32_t _has_storage_[2];
  ConverseResponse_EventType eventType;
  RPCStatus *error;
  AudioOut *audioOut;
  ConverseResult *result;
} ConverseResponse__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "error",
        .dataTypeSpecific.className = GPBStringifySymbol(RPCStatus),
        .number = ConverseResponse_FieldNumber_Error,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(ConverseResponse__storage_, error),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "eventType",
        .dataTypeSpecific.enumDescFunc = ConverseResponse_EventType_EnumDescriptor,
        .number = ConverseResponse_FieldNumber_EventType,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(ConverseResponse__storage_, eventType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "audioOut",
        .dataTypeSpecific.className = GPBStringifySymbol(AudioOut),
        .number = ConverseResponse_FieldNumber_AudioOut,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(ConverseResponse__storage_, audioOut),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "result",
        .dataTypeSpecific.className = GPBStringifySymbol(ConverseResult),
        .number = ConverseResponse_FieldNumber_Result,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(ConverseResponse__storage_, result),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ConverseResponse class]
                                     rootClass:[EmbeddedAssistantRoot class]
                                          file:EmbeddedAssistantRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ConverseResponse__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    static const char *oneofs[] = {
      "converseResponse",
    };
    [localDescriptor setupOneofs:oneofs
                           count:(uint32_t)(sizeof(oneofs) / sizeof(char*))
                   firstHasIndex:-1];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t ConverseResponse_EventType_RawValue(ConverseResponse *message) {
  GPBDescriptor *descriptor = [ConverseResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ConverseResponse_FieldNumber_EventType];
  return GPBGetMessageInt32Field(message, field);
}

void SetConverseResponse_EventType_RawValue(ConverseResponse *message, int32_t value) {
  GPBDescriptor *descriptor = [ConverseResponse descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:ConverseResponse_FieldNumber_EventType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

void ConverseResponse_ClearConverseResponseOneOfCase(ConverseResponse *message) {
  GPBDescriptor *descriptor = [message descriptor];
  GPBOneofDescriptor *oneof = [descriptor.oneofs objectAtIndex:0];
  GPBMaybeClearOneof(message, oneof, -1, 0);
}
#pragma mark - Enum ConverseResponse_EventType

GPBEnumDescriptor *ConverseResponse_EventType_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "EventTypeUnspecified\000EndOfUtterance\000";
    static const int32_t values[] = {
        ConverseResponse_EventType_EventTypeUnspecified,
        ConverseResponse_EventType_EndOfUtterance,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(ConverseResponse_EventType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:ConverseResponse_EventType_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL ConverseResponse_EventType_IsValidValue(int32_t value__) {
  switch (value__) {
    case ConverseResponse_EventType_EventTypeUnspecified:
    case ConverseResponse_EventType_EndOfUtterance:
      return YES;
    default:
      return NO;
  }
}


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
