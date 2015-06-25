//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/api/rpc/ResponseStartEmailAuth.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/EmailActivationType.h"
#include "im/actor/model/api/rpc/ResponseStartEmailAuth.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/network/parser/Response.h"
#include "java/io/IOException.h"

@interface APResponseStartEmailAuth () {
 @public
  NSString *transactionHash_;
  jboolean isRegistered__;
  APEmailActivationTypeEnum *activationType_;
}

@end

J2OBJC_FIELD_SETTER(APResponseStartEmailAuth, transactionHash_, NSString *)
J2OBJC_FIELD_SETTER(APResponseStartEmailAuth, activationType_, APEmailActivationTypeEnum *)

@implementation APResponseStartEmailAuth

+ (APResponseStartEmailAuth *)fromBytesWithByteArray:(IOSByteArray *)data {
  return APResponseStartEmailAuth_fromBytesWithByteArray_(data);
}

- (instancetype)initWithNSString:(NSString *)transactionHash
                     withBoolean:(jboolean)isRegistered
   withAPEmailActivationTypeEnum:(APEmailActivationTypeEnum *)activationType {
  APResponseStartEmailAuth_initWithNSString_withBoolean_withAPEmailActivationTypeEnum_(self, transactionHash, isRegistered, activationType);
  return self;
}

- (instancetype)init {
  APResponseStartEmailAuth_init(self);
  return self;
}

- (NSString *)getTransactionHash {
  return self->transactionHash_;
}

- (jboolean)isRegistered {
  return self->isRegistered__;
}

- (APEmailActivationTypeEnum *)getActivationType {
  return self->activationType_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->transactionHash_ = [((BSBserValues *) nil_chk(values)) getStringWithInt:1];
  self->isRegistered__ = [values getBoolWithInt:2];
  self->activationType_ = APEmailActivationTypeEnum_parseWithInt_([values getIntWithInt:3]);
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->transactionHash_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [((BSBserWriter *) nil_chk(writer)) writeStringWithInt:1 withNSString:self->transactionHash_];
  [writer writeBoolWithInt:2 withBoolean:self->isRegistered__];
  if (self->activationType_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [writer writeIntWithInt:3 withInt:[((APEmailActivationTypeEnum *) nil_chk(self->activationType_)) getValue]];
}

- (NSString *)description {
  NSString *res = @"tuple StartEmailAuth{";
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  return APResponseStartEmailAuth_HEADER;
}

@end

APResponseStartEmailAuth *APResponseStartEmailAuth_fromBytesWithByteArray_(IOSByteArray *data) {
  APResponseStartEmailAuth_initialize();
  return ((APResponseStartEmailAuth *) BSBser_parseWithBSBserObject_withByteArray_(new_APResponseStartEmailAuth_init(), data));
}

void APResponseStartEmailAuth_initWithNSString_withBoolean_withAPEmailActivationTypeEnum_(APResponseStartEmailAuth *self, NSString *transactionHash, jboolean isRegistered, APEmailActivationTypeEnum *activationType) {
  (void) APResponse_init(self);
  self->transactionHash_ = transactionHash;
  self->isRegistered__ = isRegistered;
  self->activationType_ = activationType;
}

APResponseStartEmailAuth *new_APResponseStartEmailAuth_initWithNSString_withBoolean_withAPEmailActivationTypeEnum_(NSString *transactionHash, jboolean isRegistered, APEmailActivationTypeEnum *activationType) {
  APResponseStartEmailAuth *self = [APResponseStartEmailAuth alloc];
  APResponseStartEmailAuth_initWithNSString_withBoolean_withAPEmailActivationTypeEnum_(self, transactionHash, isRegistered, activationType);
  return self;
}

void APResponseStartEmailAuth_init(APResponseStartEmailAuth *self) {
  (void) APResponse_init(self);
}

APResponseStartEmailAuth *new_APResponseStartEmailAuth_init() {
  APResponseStartEmailAuth *self = [APResponseStartEmailAuth alloc];
  APResponseStartEmailAuth_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(APResponseStartEmailAuth)