// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: google/rpc/error_details.proto

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

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/Duration.pbobjc.h>
#else
 #import "google/protobuf/Duration.pbobjc.h"
#endif

 #import "google/rpc/ErrorDetails.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - RPCErrorDetailsRoot

@implementation RPCErrorDetailsRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - RPCErrorDetailsRoot_FileDescriptor

static GPBFileDescriptor *RPCErrorDetailsRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"google.rpc"
                                                 objcPrefix:@"RPC"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - RPCRetryInfo

@implementation RPCRetryInfo

@dynamic hasRetryDelay, retryDelay;

typedef struct RPCRetryInfo__storage_ {
  uint32_t _has_storage_[1];
  GPBDuration *retryDelay;
} RPCRetryInfo__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "retryDelay",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBDuration),
        .number = RPCRetryInfo_FieldNumber_RetryDelay,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCRetryInfo__storage_, retryDelay),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCRetryInfo class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCRetryInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCDebugInfo

@implementation RPCDebugInfo

@dynamic stackEntriesArray, stackEntriesArray_Count;
@dynamic detail;

typedef struct RPCDebugInfo__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *stackEntriesArray;
  NSString *detail;
} RPCDebugInfo__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "stackEntriesArray",
        .dataTypeSpecific.className = NULL,
        .number = RPCDebugInfo_FieldNumber_StackEntriesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(RPCDebugInfo__storage_, stackEntriesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "detail",
        .dataTypeSpecific.className = NULL,
        .number = RPCDebugInfo_FieldNumber_Detail,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCDebugInfo__storage_, detail),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCDebugInfo class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCDebugInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCQuotaFailure

@implementation RPCQuotaFailure

@dynamic violationsArray, violationsArray_Count;

typedef struct RPCQuotaFailure__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *violationsArray;
} RPCQuotaFailure__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "violationsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(RPCQuotaFailure_Violation),
        .number = RPCQuotaFailure_FieldNumber_ViolationsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(RPCQuotaFailure__storage_, violationsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCQuotaFailure class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCQuotaFailure__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCQuotaFailure_Violation

@implementation RPCQuotaFailure_Violation

@dynamic subject;
@dynamic description_p;

typedef struct RPCQuotaFailure_Violation__storage_ {
  uint32_t _has_storage_[1];
  NSString *subject;
  NSString *description_p;
} RPCQuotaFailure_Violation__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "subject",
        .dataTypeSpecific.className = NULL,
        .number = RPCQuotaFailure_Violation_FieldNumber_Subject,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCQuotaFailure_Violation__storage_, subject),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = RPCQuotaFailure_Violation_FieldNumber_Description_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RPCQuotaFailure_Violation__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCQuotaFailure_Violation class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCQuotaFailure_Violation__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(RPCQuotaFailure)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCBadRequest

@implementation RPCBadRequest

@dynamic fieldViolationsArray, fieldViolationsArray_Count;

typedef struct RPCBadRequest__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *fieldViolationsArray;
} RPCBadRequest__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "fieldViolationsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(RPCBadRequest_FieldViolation),
        .number = RPCBadRequest_FieldNumber_FieldViolationsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(RPCBadRequest__storage_, fieldViolationsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCBadRequest class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCBadRequest__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCBadRequest_FieldViolation

@implementation RPCBadRequest_FieldViolation

@dynamic field;
@dynamic description_p;

typedef struct RPCBadRequest_FieldViolation__storage_ {
  uint32_t _has_storage_[1];
  NSString *field;
  NSString *description_p;
} RPCBadRequest_FieldViolation__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "field",
        .dataTypeSpecific.className = NULL,
        .number = RPCBadRequest_FieldViolation_FieldNumber_Field,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCBadRequest_FieldViolation__storage_, field),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = RPCBadRequest_FieldViolation_FieldNumber_Description_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RPCBadRequest_FieldViolation__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCBadRequest_FieldViolation class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCBadRequest_FieldViolation__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(RPCBadRequest)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCRequestInfo

@implementation RPCRequestInfo

@dynamic requestId;
@dynamic servingData;

typedef struct RPCRequestInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *requestId;
  NSString *servingData;
} RPCRequestInfo__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "requestId",
        .dataTypeSpecific.className = NULL,
        .number = RPCRequestInfo_FieldNumber_RequestId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCRequestInfo__storage_, requestId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "servingData",
        .dataTypeSpecific.className = NULL,
        .number = RPCRequestInfo_FieldNumber_ServingData,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RPCRequestInfo__storage_, servingData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCRequestInfo class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCRequestInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCResourceInfo

@implementation RPCResourceInfo

@dynamic resourceType;
@dynamic resourceName;
@dynamic owner;
@dynamic description_p;

typedef struct RPCResourceInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *resourceType;
  NSString *resourceName;
  NSString *owner;
  NSString *description_p;
} RPCResourceInfo__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "resourceType",
        .dataTypeSpecific.className = NULL,
        .number = RPCResourceInfo_FieldNumber_ResourceType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCResourceInfo__storage_, resourceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "resourceName",
        .dataTypeSpecific.className = NULL,
        .number = RPCResourceInfo_FieldNumber_ResourceName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RPCResourceInfo__storage_, resourceName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "owner",
        .dataTypeSpecific.className = NULL,
        .number = RPCResourceInfo_FieldNumber_Owner,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(RPCResourceInfo__storage_, owner),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = RPCResourceInfo_FieldNumber_Description_p,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(RPCResourceInfo__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCResourceInfo class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCResourceInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCHelp

@implementation RPCHelp

@dynamic linksArray, linksArray_Count;

typedef struct RPCHelp__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *linksArray;
} RPCHelp__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "linksArray",
        .dataTypeSpecific.className = GPBStringifySymbol(RPCHelp_Link),
        .number = RPCHelp_FieldNumber_LinksArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(RPCHelp__storage_, linksArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCHelp class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCHelp__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCHelp_Link

@implementation RPCHelp_Link

@dynamic description_p;
@dynamic URL;

typedef struct RPCHelp_Link__storage_ {
  uint32_t _has_storage_[1];
  NSString *description_p;
  NSString *URL;
} RPCHelp_Link__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = RPCHelp_Link_FieldNumber_Description_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCHelp_Link__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "URL",
        .dataTypeSpecific.className = NULL,
        .number = RPCHelp_Link_FieldNumber_URL,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RPCHelp_Link__storage_, URL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCHelp_Link class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCHelp_Link__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\002!!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(RPCHelp)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - RPCLocalizedMessage

@implementation RPCLocalizedMessage

@dynamic locale;
@dynamic message;

typedef struct RPCLocalizedMessage__storage_ {
  uint32_t _has_storage_[1];
  NSString *locale;
  NSString *message;
} RPCLocalizedMessage__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "locale",
        .dataTypeSpecific.className = NULL,
        .number = RPCLocalizedMessage_FieldNumber_Locale,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(RPCLocalizedMessage__storage_, locale),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "message",
        .dataTypeSpecific.className = NULL,
        .number = RPCLocalizedMessage_FieldNumber_Message,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(RPCLocalizedMessage__storage_, message),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[RPCLocalizedMessage class]
                                     rootClass:[RPCErrorDetailsRoot class]
                                          file:RPCErrorDetailsRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(RPCLocalizedMessage__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)