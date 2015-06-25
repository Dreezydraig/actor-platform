//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/viewmodel/UploadFileVM.java
//

#ifndef _AMUploadFileVM_H_
#define _AMUploadFileVM_H_

#include "J2ObjC_header.h"
#include "im/actor/model/mvvm/AsyncVM.h"

@class ImActorModelModulesModules;
@protocol AMUploadFileVMCallback;

@interface AMUploadFileVM : AMAsyncVM

#pragma mark Public

- (instancetype)initWithLong:(jlong)rid
  withAMUploadFileVMCallback:(id<AMUploadFileVMCallback>)vmCallback
withImActorModelModulesModules:(ImActorModelModulesModules *)modules;

- (void)detach;

#pragma mark Protected

- (void)onObjectReceivedWithId:(id)obj;

@end

J2OBJC_EMPTY_STATIC_INIT(AMUploadFileVM)

FOUNDATION_EXPORT void AMUploadFileVM_initWithLong_withAMUploadFileVMCallback_withImActorModelModulesModules_(AMUploadFileVM *self, jlong rid, id<AMUploadFileVMCallback> vmCallback, ImActorModelModulesModules *modules);

FOUNDATION_EXPORT AMUploadFileVM *new_AMUploadFileVM_initWithLong_withAMUploadFileVMCallback_withImActorModelModulesModules_(jlong rid, id<AMUploadFileVMCallback> vmCallback, ImActorModelModulesModules *modules) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMUploadFileVM)

typedef AMUploadFileVM ImActorModelViewmodelUploadFileVM;

#endif // _AMUploadFileVM_H_