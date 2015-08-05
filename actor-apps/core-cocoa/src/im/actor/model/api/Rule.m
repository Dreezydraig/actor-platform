//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/Rule.java
//


#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Action.h"
#include "im/actor/model/api/Rule.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"
#include "java/util/List.h"

@interface APRule () {
 @public
  APActionEnum *action_;
  id<JavaUtilList> longValues_;
  id<JavaUtilList> rawValues_;
}

@end

J2OBJC_FIELD_SETTER(APRule, action_, APActionEnum *)
J2OBJC_FIELD_SETTER(APRule, longValues_, id<JavaUtilList>)
J2OBJC_FIELD_SETTER(APRule, rawValues_, id<JavaUtilList>)

@implementation APRule

- (instancetype)initWithAPActionEnum:(APActionEnum *)action
                    withJavaUtilList:(id<JavaUtilList>)longValues
                    withJavaUtilList:(id<JavaUtilList>)rawValues {
  APRule_initWithAPActionEnum_withJavaUtilList_withJavaUtilList_(self, action, longValues, rawValues);
  return self;
}

- (instancetype)init {
  APRule_init(self);
  return self;
}

- (APActionEnum *)getAction {
  return self->action_;
}

- (id<JavaUtilList>)getLongValues {
  return self->longValues_;
}

- (id<JavaUtilList>)getRawValues {
  return self->rawValues_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->action_ = APActionEnum_parseWithInt_([((BSBserValues *) nil_chk(values)) getIntWithInt:1]);
  self->longValues_ = [values getRepeatedLongWithInt:2];
  self->rawValues_ = [values getRepeatedBytesWithInt:3];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->action_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:[((APActionEnum *) nil_chk(self->action_)) getValue]];
  [writer writeRepeatedLongWithInt:2 withJavaUtilList:self->longValues_];
  [writer writeRepeatedBytesWithInt:3 withJavaUtilList:self->rawValues_];
}

- (NSString *)description {
  NSString *res = @"struct Rule{";
  res = JreStrcat("$$", res, JreStrcat("$@", @"action=", self->action_));
  res = JreStrcat("$$", res, JreStrcat("$I", @", longValues=", [((id<JavaUtilList>) nil_chk(self->longValues_)) size]));
  res = JreStrcat("$$", res, JreStrcat("$I", @", rawValues=", [((id<JavaUtilList>) nil_chk(self->rawValues_)) size]));
  res = JreStrcat("$C", res, '}');
  return res;
}

@end

void APRule_initWithAPActionEnum_withJavaUtilList_withJavaUtilList_(APRule *self, APActionEnum *action, id<JavaUtilList> longValues, id<JavaUtilList> rawValues) {
  (void) BSBserObject_init(self);
  self->action_ = action;
  self->longValues_ = longValues;
  self->rawValues_ = rawValues;
}

APRule *new_APRule_initWithAPActionEnum_withJavaUtilList_withJavaUtilList_(APActionEnum *action, id<JavaUtilList> longValues, id<JavaUtilList> rawValues) {
  APRule *self = [APRule alloc];
  APRule_initWithAPActionEnum_withJavaUtilList_withJavaUtilList_(self, action, longValues, rawValues);
  return self;
}

void APRule_init(APRule *self) {
  (void) BSBserObject_init(self);
}

APRule *new_APRule_init() {
  APRule *self = [APRule alloc];
  APRule_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(APRule)