//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/api/updates/UpdateConfig.java
//

#ifndef _APUpdateConfig_H_
#define _APUpdateConfig_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Update.h"

@class APConfig;
@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define APUpdateConfig_HEADER 42

@interface APUpdateConfig : APUpdate

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithAPConfig:(APConfig *)config;

+ (APUpdateConfig *)fromBytesWithByteArray:(IOSByteArray *)data;

- (APConfig *)getConfig;

- (jint)getHeaderKey;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APUpdateConfig)

J2OBJC_STATIC_FIELD_GETTER(APUpdateConfig, HEADER, jint)

FOUNDATION_EXPORT APUpdateConfig *APUpdateConfig_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APUpdateConfig_initWithAPConfig_(APUpdateConfig *self, APConfig *config);

FOUNDATION_EXPORT APUpdateConfig *new_APUpdateConfig_initWithAPConfig_(APConfig *config) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APUpdateConfig_init(APUpdateConfig *self);

FOUNDATION_EXPORT APUpdateConfig *new_APUpdateConfig_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APUpdateConfig)

typedef APUpdateConfig ImActorModelApiUpdatesUpdateConfig;

#endif // _APUpdateConfig_H_