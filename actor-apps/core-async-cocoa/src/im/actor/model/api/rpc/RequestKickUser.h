//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/api/rpc/RequestKickUser.java
//

#ifndef _APRequestKickUser_H_
#define _APRequestKickUser_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class APGroupOutPeer;
@class APUserOutPeer;
@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define APRequestKickUser_HEADER 71

@interface APRequestKickUser : APRequest

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithAPGroupOutPeer:(APGroupOutPeer *)groupPeer
                              withLong:(jlong)rid
                     withAPUserOutPeer:(APUserOutPeer *)user;

+ (APRequestKickUser *)fromBytesWithByteArray:(IOSByteArray *)data;

- (APGroupOutPeer *)getGroupPeer;

- (jint)getHeaderKey;

- (jlong)getRid;

- (APUserOutPeer *)getUser;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestKickUser)

J2OBJC_STATIC_FIELD_GETTER(APRequestKickUser, HEADER, jint)

FOUNDATION_EXPORT APRequestKickUser *APRequestKickUser_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestKickUser_initWithAPGroupOutPeer_withLong_withAPUserOutPeer_(APRequestKickUser *self, APGroupOutPeer *groupPeer, jlong rid, APUserOutPeer *user);

FOUNDATION_EXPORT APRequestKickUser *new_APRequestKickUser_initWithAPGroupOutPeer_withLong_withAPUserOutPeer_(APGroupOutPeer *groupPeer, jlong rid, APUserOutPeer *user) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APRequestKickUser_init(APRequestKickUser *self);

FOUNDATION_EXPORT APRequestKickUser *new_APRequestKickUser_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestKickUser)

typedef APRequestKickUser ImActorModelApiRpcRequestKickUser;

#endif // _APRequestKickUser_H_