//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/entity/Avatar.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/AvatarImage.h"

@interface ImActorModelEntityAvatar () {
 @public
  ImActorModelEntityAvatarImage *smallImage_;
  ImActorModelEntityAvatarImage *largeImage_;
  ImActorModelEntityAvatarImage *fullImage_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelEntityAvatar, smallImage_, ImActorModelEntityAvatarImage *)
J2OBJC_FIELD_SETTER(ImActorModelEntityAvatar, largeImage_, ImActorModelEntityAvatarImage *)
J2OBJC_FIELD_SETTER(ImActorModelEntityAvatar, fullImage_, ImActorModelEntityAvatarImage *)

@implementation ImActorModelEntityAvatar

- (instancetype)initWithImActorModelEntityAvatarImage:(ImActorModelEntityAvatarImage *)smallImage
                    withImActorModelEntityAvatarImage:(ImActorModelEntityAvatarImage *)largeImage
                    withImActorModelEntityAvatarImage:(ImActorModelEntityAvatarImage *)fullImage {
  if (self = [super init]) {
    ImActorModelEntityAvatar_set_smallImage_(self, smallImage);
    ImActorModelEntityAvatar_set_largeImage_(self, largeImage);
    ImActorModelEntityAvatar_set_fullImage_(self, fullImage);
  }
  return self;
}

- (ImActorModelEntityAvatarImage *)getSmallImage {
  return smallImage_;
}

- (ImActorModelEntityAvatarImage *)getLargeImage {
  return largeImage_;
}

- (ImActorModelEntityAvatarImage *)getFullImage {
  return fullImage_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ImActorModelEntityAvatar *avatar = (ImActorModelEntityAvatar *) check_class_cast(o, [ImActorModelEntityAvatar class]);
  if (fullImage_ != nil ? ![fullImage_ isEqual:((ImActorModelEntityAvatar *) nil_chk(avatar))->fullImage_] : ((ImActorModelEntityAvatar *) nil_chk(avatar))->fullImage_ != nil) return NO;
  if (largeImage_ != nil ? ![largeImage_ isEqual:((ImActorModelEntityAvatar *) nil_chk(avatar))->largeImage_] : ((ImActorModelEntityAvatar *) nil_chk(avatar))->largeImage_ != nil) return NO;
  if (smallImage_ != nil ? ![smallImage_ isEqual:((ImActorModelEntityAvatar *) nil_chk(avatar))->smallImage_] : ((ImActorModelEntityAvatar *) nil_chk(avatar))->smallImage_ != nil) return NO;
  return YES;
}

- (NSUInteger)hash {
  jint result = smallImage_ != nil ? ((jint) [smallImage_ hash]) : 0;
  result = 31 * result + (largeImage_ != nil ? ((jint) [largeImage_ hash]) : 0);
  result = 31 * result + (fullImage_ != nil ? ((jint) [fullImage_ hash]) : 0);
  return result;
}

- (void)dealloc {
  RELEASE_(smallImage_);
  RELEASE_(largeImage_);
  RELEASE_(fullImage_);
  [super dealloc];
}

- (void)copyAllFieldsTo:(ImActorModelEntityAvatar *)other {
  [super copyAllFieldsTo:other];
  ImActorModelEntityAvatar_set_smallImage_(other, smallImage_);
  ImActorModelEntityAvatar_set_largeImage_(other, largeImage_);
  ImActorModelEntityAvatar_set_fullImage_(other, fullImage_);
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithImActorModelEntityAvatarImage:withImActorModelEntityAvatarImage:withImActorModelEntityAvatarImage:", "Avatar", NULL, 0x1, NULL },
    { "getSmallImage", NULL, "Lim.actor.model.entity.AvatarImage;", 0x1, NULL },
    { "getLargeImage", NULL, "Lim.actor.model.entity.AvatarImage;", 0x1, NULL },
    { "getFullImage", NULL, "Lim.actor.model.entity.AvatarImage;", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "smallImage_", NULL, 0x12, "Lim.actor.model.entity.AvatarImage;", NULL,  },
    { "largeImage_", NULL, 0x12, "Lim.actor.model.entity.AvatarImage;", NULL,  },
    { "fullImage_", NULL, 0x12, "Lim.actor.model.entity.AvatarImage;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelEntityAvatar = { 1, "Avatar", "im.actor.model.entity", NULL, 0x1, 6, methods, 3, fields, 0, NULL};
  return &_ImActorModelEntityAvatar;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelEntityAvatar)