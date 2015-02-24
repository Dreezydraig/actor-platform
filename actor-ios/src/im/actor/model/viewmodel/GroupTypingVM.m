//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/viewmodel/GroupTypingVM.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/viewmodel/GroupTypingVM.h"

@interface AMGroupTypingVM () {
 @public
  jint gid_;
  AMValueModel *active_;
}
@end

J2OBJC_FIELD_SETTER(AMGroupTypingVM, active_, AMValueModel *)

@implementation AMGroupTypingVM

- (instancetype)initWithInt:(jint)gid {
  if (self = [super init]) {
    self->gid_ = gid;
    self->active_ = [[AMValueModel alloc] initWithNSString:JreStrcat("$I$", @"groups.", gid, @".typing") withId:[IOSIntArray newArrayWithLength:0]];
  }
  return self;
}

- (jint)getGid {
  return gid_;
}

- (AMValueModel *)getActive {
  return active_;
}

- (void)copyAllFieldsTo:(AMGroupTypingVM *)other {
  [super copyAllFieldsTo:other];
  other->gid_ = gid_;
  other->active_ = active_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMGroupTypingVM)