//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/modules/notifications/NotificationsActor.java
//


#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/Messenger.h"
#include "im/actor/model/NotificationProvider.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/engine/SyncKeyValue.h"
#include "im/actor/model/entity/ContentDescription.h"
#include "im/actor/model/entity/Notification.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Notifications.h"
#include "im/actor/model/modules/Settings.h"
#include "im/actor/model/modules/notifications/NotificationsActor.h"
#include "im/actor/model/modules/notifications/entity/PendingNotification.h"
#include "im/actor/model/modules/notifications/entity/PendingStorage.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "java/io/IOException.h"
#include "java/util/ArrayList.h"
#include "java/util/HashSet.h"
#include "java/util/List.h"

#define ImActorModelModulesNotificationsNotificationsActor_MAX_NOTIFICATION_COUNT 10

@interface ImActorModelModulesNotificationsNotificationsActor () {
 @public
  DKSyncKeyValue *storage_;
  ImActorModelModulesNotificationsEntityPendingStorage *pendingStorage_;
  AMPeer *visiblePeer_;
  jboolean isAppVisible_;
  jboolean isDialogsVisible_;
  jboolean isNotificationsPaused_;
  JavaUtilHashSet *notificationsDuringPause_;
}

- (id<JavaUtilList>)getNotifications;

- (void)performNotificationWithBoolean:(jboolean)isSilentUpdate;

- (void)hideNotification;

- (void)saveStorage;

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor, storage_, DKSyncKeyValue *)
J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor, pendingStorage_, ImActorModelModulesNotificationsEntityPendingStorage *)
J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor, visiblePeer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor, notificationsDuringPause_, JavaUtilHashSet *)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesNotificationsNotificationsActor, MAX_NOTIFICATION_COUNT, jint)

__attribute__((unused)) static id<JavaUtilList> ImActorModelModulesNotificationsNotificationsActor_getNotifications(ImActorModelModulesNotificationsNotificationsActor *self);

__attribute__((unused)) static void ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(ImActorModelModulesNotificationsNotificationsActor *self, jboolean isSilentUpdate);

__attribute__((unused)) static void ImActorModelModulesNotificationsNotificationsActor_hideNotification(ImActorModelModulesNotificationsNotificationsActor *self);

__attribute__((unused)) static void ImActorModelModulesNotificationsNotificationsActor_saveStorage(ImActorModelModulesNotificationsNotificationsActor *self);

@interface ImActorModelModulesNotificationsNotificationsActor_NewMessage () {
 @public
  AMPeer *peer_;
  jint sender_;
  jlong sortDate_;
  AMContentDescription *contentDescription_;
  jboolean hasCurrentUserMention_;
  jboolean isAlreadyRead__;
  jboolean isLastInDiff__;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor_NewMessage, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor_NewMessage, contentDescription_, AMContentDescription *)

@interface ImActorModelModulesNotificationsNotificationsActor_MessagesRead () {
 @public
  AMPeer *peer_;
  jlong fromDate_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor_MessagesRead, peer_, AMPeer *)

@interface ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible () {
 @public
  AMPeer *peer_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible, peer_, AMPeer *)

@interface ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden () {
 @public
  AMPeer *peer_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden, peer_, AMPeer *)

@implementation ImActorModelModulesNotificationsNotificationsActor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  ImActorModelModulesNotificationsNotificationsActor_initWithImActorModelModulesModules_(self, messenger);
  return self;
}

- (void)preStart {
  pendingStorage_ = new_ImActorModelModulesNotificationsEntityPendingStorage_init();
  IOSByteArray *storage = [((DKSyncKeyValue *) nil_chk(self->storage_)) getWithLong:0];
  if (storage != nil) {
    @try {
      pendingStorage_ = ImActorModelModulesNotificationsEntityPendingStorage_fromBytesWithByteArray_(storage);
    }
    @catch (JavaIoIOException *e) {
      [((JavaIoIOException *) nil_chk(e)) printStackTrace];
    }
  }
}

- (id<JavaUtilList>)getNotifications {
  return ImActorModelModulesNotificationsNotificationsActor_getNotifications(self);
}

- (void)onNewMessageWithAMPeer:(AMPeer *)peer
                       withInt:(jint)sender
                      withLong:(jlong)date
      withAMContentDescription:(AMContentDescription *)description_
                   withBoolean:(jboolean)hasCurrentUserMention
                   withBoolean:(jboolean)isAlreadyRead
                   withBoolean:(jboolean)isLastInDiff {
  if (isLastInDiff) {
    [((DKActorRef *) nil_chk([self self__])) sendWithId:new_ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications_init()];
  }
  if (isAlreadyRead) {
    return;
  }
  jboolean isPeerEnabled = [((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isNotificationsEnabledWithAMPeer:peer];
  jboolean isEnabled = ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isNotificationsEnabled] && isPeerEnabled) || hasCurrentUserMention;
  if (isEnabled) {
    id<JavaUtilList> allPending = ImActorModelModulesNotificationsNotificationsActor_getNotifications(self);
    [((id<JavaUtilList>) nil_chk(allPending)) addWithId:new_ImActorModelModulesNotificationsEntityPendingNotification_initWithAMPeer_withInt_withLong_withAMContentDescription_(peer, sender, date, description_)];
    ImActorModelModulesNotificationsNotificationsActor_saveStorage(self);
  }
  if (isNotificationsPaused_) {
    if (isEnabled) {
      [((JavaUtilHashSet *) nil_chk(notificationsDuringPause_)) addWithId:peer];
    }
    return;
  }
  if ([((AMConfiguration *) nil_chk([self config])) getNotificationProvider] != nil) {
    if (isAppVisible_) {
      if (visiblePeer_ != nil && [visiblePeer_ isEqual:peer]) {
        if ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isConversationTonesEnabled]) {
          [((id<AMNotificationProvider>) nil_chk([((AMConfiguration *) nil_chk([self config])) getNotificationProvider])) onMessageArriveInAppWithMessenger:[((ImActorModelModulesModules *) nil_chk([self modules])) getMessenger]];
        }
      }
      else if (isDialogsVisible_) {
        if ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isConversationTonesEnabled]) {
          [((id<AMNotificationProvider>) nil_chk([((AMConfiguration *) nil_chk([self config])) getNotificationProvider])) onMessageArriveInAppWithMessenger:[((ImActorModelModulesModules *) nil_chk([self modules])) getMessenger]];
        }
      }
      else if ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isInAppEnabled]) {
        if (isPeerEnabled) {
          ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, NO);
        }
      }
    }
    else {
      if (isEnabled) {
        ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, NO);
      }
    }
  }
}

- (void)onMessagesReadWithAMPeer:(AMPeer *)peer
                        withLong:(jlong)fromDate {
  jboolean isChanged = NO;
  id<JavaUtilList> notifications = [((ImActorModelModulesNotificationsEntityPendingStorage *) nil_chk(pendingStorage_)) getNotifications];
  {
    IOSObjectArray *a__ = [notifications toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:[((id<JavaUtilList>) nil_chk(notifications)) size] type:ImActorModelModulesNotificationsEntityPendingNotification_class_()]];
    ImActorModelModulesNotificationsEntityPendingNotification * const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    ImActorModelModulesNotificationsEntityPendingNotification * const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      ImActorModelModulesNotificationsEntityPendingNotification *p = *b__++;
      if ([((AMPeer *) nil_chk([((ImActorModelModulesNotificationsEntityPendingNotification *) nil_chk(p)) getPeer])) isEqual:peer] && [p getDate] <= fromDate) {
        [((id<JavaUtilList>) nil_chk([pendingStorage_ getNotifications])) removeWithId:p];
        isChanged = YES;
      }
    }
  }
  if (isChanged) {
    ImActorModelModulesNotificationsNotificationsActor_saveStorage(self);
    ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, YES);
  }
}

- (void)onNotificationsPaused {
  [((JavaUtilHashSet *) nil_chk(notificationsDuringPause_)) clear];
  isNotificationsPaused_ = YES;
}

- (void)onNotificationsResumed {
  isNotificationsPaused_ = NO;
  if ([((JavaUtilHashSet *) nil_chk(notificationsDuringPause_)) size] > 0) {
    if ([((AMConfiguration *) nil_chk([self config])) getNotificationProvider] != nil) {
      if (visiblePeer_ != nil && [notificationsDuringPause_ containsWithId:visiblePeer_]) {
        if ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isConversationTonesEnabled]) {
          [((id<AMNotificationProvider>) nil_chk([((AMConfiguration *) nil_chk([self config])) getNotificationProvider])) onMessageArriveInAppWithMessenger:[((ImActorModelModulesModules *) nil_chk([self modules])) getMessenger]];
        }
      }
      else if (isDialogsVisible_) {
        if ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isConversationTonesEnabled]) {
          [((id<AMNotificationProvider>) nil_chk([((AMConfiguration *) nil_chk([self config])) getNotificationProvider])) onMessageArriveInAppWithMessenger:[((ImActorModelModulesModules *) nil_chk([self modules])) getMessenger]];
        }
      }
      else if (isAppVisible_) {
        if ([((ImActorModelModulesSettings *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getSettings])) isInAppEnabled]) {
          ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, NO);
        }
      }
      else {
        ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, NO);
      }
    }
  }
  [notificationsDuringPause_ clear];
}

- (void)onConversationVisibleWithAMPeer:(AMPeer *)peer {
  self->visiblePeer_ = peer;
  ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, YES);
}

- (void)onConversationHiddenWithAMPeer:(AMPeer *)peer {
  if (visiblePeer_ != nil && [visiblePeer_ isEqual:peer]) {
    self->visiblePeer_ = nil;
  }
}

- (void)onAppVisible {
  isAppVisible_ = YES;
  ImActorModelModulesNotificationsNotificationsActor_hideNotification(self);
}

- (void)onAppHidden {
  isAppVisible_ = NO;
}

- (void)onDialogsVisible {
  isDialogsVisible_ = YES;
  ImActorModelModulesNotificationsNotificationsActor_hideNotification(self);
}

- (void)onDialogsHidden {
  isDialogsVisible_ = NO;
}

- (void)performNotificationWithBoolean:(jboolean)isSilentUpdate {
  ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(self, isSilentUpdate);
}

- (void)hideNotification {
  ImActorModelModulesNotificationsNotificationsActor_hideNotification(self);
}

- (void)saveStorage {
  ImActorModelModulesNotificationsNotificationsActor_saveStorage(self);
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_NewMessage class]]) {
    ImActorModelModulesNotificationsNotificationsActor_NewMessage *newMessage = (ImActorModelModulesNotificationsNotificationsActor_NewMessage *) check_class_cast(message, [ImActorModelModulesNotificationsNotificationsActor_NewMessage class]);
    [self onNewMessageWithAMPeer:[((ImActorModelModulesNotificationsNotificationsActor_NewMessage *) nil_chk(newMessage)) getPeer] withInt:[newMessage getSender] withLong:[newMessage getSortDate] withAMContentDescription:[newMessage getContentDescription] withBoolean:[newMessage getHasCurrentUserMention] withBoolean:[newMessage isAlreadyRead] withBoolean:[newMessage isLastInDiff]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_MessagesRead class]]) {
    ImActorModelModulesNotificationsNotificationsActor_MessagesRead *read = (ImActorModelModulesNotificationsNotificationsActor_MessagesRead *) check_class_cast(message, [ImActorModelModulesNotificationsNotificationsActor_MessagesRead class]);
    [self onMessagesReadWithAMPeer:[((ImActorModelModulesNotificationsNotificationsActor_MessagesRead *) nil_chk(read)) getPeer] withLong:[read getFromDate]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible class]]) {
    [self onConversationVisibleWithAMPeer:[((ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible *) nil_chk(((ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible *) check_class_cast(message, [ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible class])))) getPeer]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden class]]) {
    [self onConversationHiddenWithAMPeer:[((ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden *) nil_chk(((ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden *) check_class_cast(message, [ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden class])))) getPeer]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_OnAppHidden class]]) {
    [self onAppHidden];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_OnAppVisible class]]) {
    [self onAppVisible];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible class]]) {
    [self onDialogsVisible];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden class]]) {
    [self onDialogsHidden];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_PauseNotifications class]]) {
    [self onNotificationsPaused];
  }
  else if ([message isKindOfClass:[ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications class]]) {
    [self onNotificationsResumed];
  }
  else {
    [self dropWithId:message];
  }
}

@end

void ImActorModelModulesNotificationsNotificationsActor_initWithImActorModelModulesModules_(ImActorModelModulesNotificationsNotificationsActor *self, ImActorModelModulesModules *messenger) {
  (void) ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, messenger);
  self->isAppVisible_ = NO;
  self->isDialogsVisible_ = NO;
  self->isNotificationsPaused_ = NO;
  self->notificationsDuringPause_ = new_JavaUtilHashSet_init();
  self->storage_ = [((ImActorModelModulesNotifications *) nil_chk([((ImActorModelModulesModules *) nil_chk(messenger)) getNotifications])) getNotificationsStorage];
}

ImActorModelModulesNotificationsNotificationsActor *new_ImActorModelModulesNotificationsNotificationsActor_initWithImActorModelModulesModules_(ImActorModelModulesModules *messenger) {
  ImActorModelModulesNotificationsNotificationsActor *self = [ImActorModelModulesNotificationsNotificationsActor alloc];
  ImActorModelModulesNotificationsNotificationsActor_initWithImActorModelModulesModules_(self, messenger);
  return self;
}

id<JavaUtilList> ImActorModelModulesNotificationsNotificationsActor_getNotifications(ImActorModelModulesNotificationsNotificationsActor *self) {
  return [((ImActorModelModulesNotificationsEntityPendingStorage *) nil_chk(self->pendingStorage_)) getNotifications];
}

void ImActorModelModulesNotificationsNotificationsActor_performNotificationWithBoolean_(ImActorModelModulesNotificationsNotificationsActor *self, jboolean isSilentUpdate) {
  id<JavaUtilList> allPending = ImActorModelModulesNotificationsNotificationsActor_getNotifications(self);
  id<JavaUtilList> destNotifications = new_JavaUtilArrayList_init();
  for (jint i = 0; i < [((id<JavaUtilList>) nil_chk(allPending)) size]; i++) {
    if ([destNotifications size] >= ImActorModelModulesNotificationsNotificationsActor_MAX_NOTIFICATION_COUNT) {
      break;
    }
    ImActorModelModulesNotificationsEntityPendingNotification *pendingNotification = [allPending getWithInt:[allPending size] - 1 - i];
    if (self->visiblePeer_ != nil && [self->visiblePeer_ isEqual:[((ImActorModelModulesNotificationsEntityPendingNotification *) nil_chk(pendingNotification)) getPeer]]) {
      continue;
    }
    [destNotifications addWithId:pendingNotification];
  }
  if ([destNotifications size] == 0) {
    ImActorModelModulesNotificationsNotificationsActor_hideNotification(self);
    return;
  }
  id<JavaUtilList> res = new_JavaUtilArrayList_init();
  for (ImActorModelModulesNotificationsEntityPendingNotification * __strong p in destNotifications) {
    [res addWithId:new_AMNotification_initWithAMPeer_withInt_withAMContentDescription_([((ImActorModelModulesNotificationsEntityPendingNotification *) nil_chk(p)) getPeer], [p getSender], [p getContent])];
  }
  jint messagesCount = [allPending size];
  JavaUtilHashSet *peers = new_JavaUtilHashSet_init();
  for (ImActorModelModulesNotificationsEntityPendingNotification * __strong p in allPending) {
    [peers addWithId:[((ImActorModelModulesNotificationsEntityPendingNotification *) nil_chk(p)) getPeer]];
  }
  jint chatsCount = [peers size];
  [((id<AMNotificationProvider>) nil_chk([((AMConfiguration *) nil_chk([self config])) getNotificationProvider])) onNotificationWithMessenger:[((ImActorModelModulesModules *) nil_chk([self modules])) getMessenger] withTopNotifications:res withMessagesCount:messagesCount withConversationsCount:chatsCount withSilentUpdate:isSilentUpdate withIsInApp:self->isAppVisible_];
}

void ImActorModelModulesNotificationsNotificationsActor_hideNotification(ImActorModelModulesNotificationsNotificationsActor *self) {
  [((id<AMNotificationProvider>) nil_chk([((AMConfiguration *) nil_chk([self config])) getNotificationProvider])) hideAllNotifications];
}

void ImActorModelModulesNotificationsNotificationsActor_saveStorage(ImActorModelModulesNotificationsNotificationsActor *self) {
  [((DKSyncKeyValue *) nil_chk(self->storage_)) putWithLong:0 withByteArray:[((ImActorModelModulesNotificationsEntityPendingStorage *) nil_chk(self->pendingStorage_)) toByteArray]];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor)

@implementation ImActorModelModulesNotificationsNotificationsActor_NewMessage

- (instancetype)initWithAMPeer:(AMPeer *)peer
                       withInt:(jint)sender
                      withLong:(jlong)sortDate
      withAMContentDescription:(AMContentDescription *)contentDescription
                   withBoolean:(jboolean)hasCurrentUserMention
                   withBoolean:(jboolean)isAlreadyRead
                   withBoolean:(jboolean)isLastInDiff {
  ImActorModelModulesNotificationsNotificationsActor_NewMessage_initWithAMPeer_withInt_withLong_withAMContentDescription_withBoolean_withBoolean_withBoolean_(self, peer, sender, sortDate, contentDescription, hasCurrentUserMention, isAlreadyRead, isLastInDiff);
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (jint)getSender {
  return sender_;
}

- (jlong)getSortDate {
  return sortDate_;
}

- (AMContentDescription *)getContentDescription {
  return contentDescription_;
}

- (jboolean)getHasCurrentUserMention {
  return hasCurrentUserMention_;
}

- (jboolean)isAlreadyRead {
  return isAlreadyRead__;
}

- (jboolean)isLastInDiff {
  return isLastInDiff__;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_NewMessage_initWithAMPeer_withInt_withLong_withAMContentDescription_withBoolean_withBoolean_withBoolean_(ImActorModelModulesNotificationsNotificationsActor_NewMessage *self, AMPeer *peer, jint sender, jlong sortDate, AMContentDescription *contentDescription, jboolean hasCurrentUserMention, jboolean isAlreadyRead, jboolean isLastInDiff) {
  (void) NSObject_init(self);
  self->peer_ = peer;
  self->sender_ = sender;
  self->sortDate_ = sortDate;
  self->contentDescription_ = contentDescription;
  self->hasCurrentUserMention_ = hasCurrentUserMention;
  self->isAlreadyRead__ = isAlreadyRead;
  self->isLastInDiff__ = isLastInDiff;
}

ImActorModelModulesNotificationsNotificationsActor_NewMessage *new_ImActorModelModulesNotificationsNotificationsActor_NewMessage_initWithAMPeer_withInt_withLong_withAMContentDescription_withBoolean_withBoolean_withBoolean_(AMPeer *peer, jint sender, jlong sortDate, AMContentDescription *contentDescription, jboolean hasCurrentUserMention, jboolean isAlreadyRead, jboolean isLastInDiff) {
  ImActorModelModulesNotificationsNotificationsActor_NewMessage *self = [ImActorModelModulesNotificationsNotificationsActor_NewMessage alloc];
  ImActorModelModulesNotificationsNotificationsActor_NewMessage_initWithAMPeer_withInt_withLong_withAMContentDescription_withBoolean_withBoolean_withBoolean_(self, peer, sender, sortDate, contentDescription, hasCurrentUserMention, isAlreadyRead, isLastInDiff);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_NewMessage)

@implementation ImActorModelModulesNotificationsNotificationsActor_MessagesRead

- (instancetype)initWithAMPeer:(AMPeer *)peer
                      withLong:(jlong)fromDate {
  ImActorModelModulesNotificationsNotificationsActor_MessagesRead_initWithAMPeer_withLong_(self, peer, fromDate);
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (jlong)getFromDate {
  return fromDate_;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_MessagesRead_initWithAMPeer_withLong_(ImActorModelModulesNotificationsNotificationsActor_MessagesRead *self, AMPeer *peer, jlong fromDate) {
  (void) NSObject_init(self);
  self->peer_ = peer;
  self->fromDate_ = fromDate;
}

ImActorModelModulesNotificationsNotificationsActor_MessagesRead *new_ImActorModelModulesNotificationsNotificationsActor_MessagesRead_initWithAMPeer_withLong_(AMPeer *peer, jlong fromDate) {
  ImActorModelModulesNotificationsNotificationsActor_MessagesRead *self = [ImActorModelModulesNotificationsNotificationsActor_MessagesRead alloc];
  ImActorModelModulesNotificationsNotificationsActor_MessagesRead_initWithAMPeer_withLong_(self, peer, fromDate);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_MessagesRead)

@implementation ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible

- (instancetype)initWithAMPeer:(AMPeer *)peer {
  ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible_initWithAMPeer_(self, peer);
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible_initWithAMPeer_(ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible *self, AMPeer *peer) {
  (void) NSObject_init(self);
  self->peer_ = peer;
}

ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible *new_ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible_initWithAMPeer_(AMPeer *peer) {
  ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible *self = [ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible alloc];
  ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible_initWithAMPeer_(self, peer);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_OnConversationVisible)

@implementation ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden

- (instancetype)initWithAMPeer:(AMPeer *)peer {
  ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden_initWithAMPeer_(self, peer);
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden_initWithAMPeer_(ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden *self, AMPeer *peer) {
  (void) NSObject_init(self);
  self->peer_ = peer;
}

ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden *new_ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden_initWithAMPeer_(AMPeer *peer) {
  ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden *self = [ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden alloc];
  ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden_initWithAMPeer_(self, peer);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_OnConversationHidden)

@implementation ImActorModelModulesNotificationsNotificationsActor_OnAppVisible

- (instancetype)init {
  ImActorModelModulesNotificationsNotificationsActor_OnAppVisible_init(self);
  return self;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_OnAppVisible_init(ImActorModelModulesNotificationsNotificationsActor_OnAppVisible *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesNotificationsNotificationsActor_OnAppVisible *new_ImActorModelModulesNotificationsNotificationsActor_OnAppVisible_init() {
  ImActorModelModulesNotificationsNotificationsActor_OnAppVisible *self = [ImActorModelModulesNotificationsNotificationsActor_OnAppVisible alloc];
  ImActorModelModulesNotificationsNotificationsActor_OnAppVisible_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_OnAppVisible)

@implementation ImActorModelModulesNotificationsNotificationsActor_OnAppHidden

- (instancetype)init {
  ImActorModelModulesNotificationsNotificationsActor_OnAppHidden_init(self);
  return self;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_OnAppHidden_init(ImActorModelModulesNotificationsNotificationsActor_OnAppHidden *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesNotificationsNotificationsActor_OnAppHidden *new_ImActorModelModulesNotificationsNotificationsActor_OnAppHidden_init() {
  ImActorModelModulesNotificationsNotificationsActor_OnAppHidden *self = [ImActorModelModulesNotificationsNotificationsActor_OnAppHidden alloc];
  ImActorModelModulesNotificationsNotificationsActor_OnAppHidden_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_OnAppHidden)

@implementation ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible

- (instancetype)init {
  ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible_init(self);
  return self;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible_init(ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible *new_ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible_init() {
  ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible *self = [ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible alloc];
  ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_OnDialogsVisible)

@implementation ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden

- (instancetype)init {
  ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden_init(self);
  return self;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden_init(ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden *new_ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden_init() {
  ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden *self = [ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden alloc];
  ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_OnDialogsHidden)

@implementation ImActorModelModulesNotificationsNotificationsActor_PauseNotifications

- (instancetype)init {
  ImActorModelModulesNotificationsNotificationsActor_PauseNotifications_init(self);
  return self;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_PauseNotifications_init(ImActorModelModulesNotificationsNotificationsActor_PauseNotifications *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesNotificationsNotificationsActor_PauseNotifications *new_ImActorModelModulesNotificationsNotificationsActor_PauseNotifications_init() {
  ImActorModelModulesNotificationsNotificationsActor_PauseNotifications *self = [ImActorModelModulesNotificationsNotificationsActor_PauseNotifications alloc];
  ImActorModelModulesNotificationsNotificationsActor_PauseNotifications_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_PauseNotifications)

@implementation ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications

- (instancetype)init {
  ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications_init(self);
  return self;
}

@end

void ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications_init(ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications *new_ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications_init() {
  ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications *self = [ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications alloc];
  ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsNotificationsActor_ResumeNotifications)