//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/math/ec/ScaleXPointMap.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/ScaleXPointMap.h"

@implementation OrgBouncycastleMathEcScaleXPointMap

- (instancetype)initWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)scale_ {
  if (self = [super init]) {
    self->scale__ = scale_;
  }
  return self;
}

- (OrgBouncycastleMathEcECPoint *)mapWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p {
  return [((OrgBouncycastleMathEcECPoint *) nil_chk(p)) scaleXWithOrgBouncycastleMathEcECFieldElement:scale__];
}

- (void)copyAllFieldsTo:(OrgBouncycastleMathEcScaleXPointMap *)other {
  [super copyAllFieldsTo:other];
  other->scale__ = scale__;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcScaleXPointMap)