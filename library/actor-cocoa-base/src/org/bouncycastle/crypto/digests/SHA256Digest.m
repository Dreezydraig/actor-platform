//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/crypto/digests/SHA256Digest.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/crypto/digests/SHA256Digest.java"

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/System.h"
#include "org/bouncycastle/crypto/digests/GeneralDigest.h"
#include "org/bouncycastle/crypto/digests/SHA256Digest.h"
#include "org/bouncycastle/util/Memoable.h"
#include "org/bouncycastle/util/Pack.h"

__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x, jint y, jint z);
__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x, jint y, jint z);
__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x);
__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x);
__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA256Digest_Theta0WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x);
__attribute__((unused)) static jint OrgBouncycastleCryptoDigestsSHA256Digest_Theta1WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x);

@interface OrgBouncycastleCryptoDigestsSHA256Digest () {
 @public
  jint H1_, H2_, H3_, H4_, H5_, H6_, H7_, H8_;
  IOSIntArray *X_;
  jint xOff_;
}

- (void)copyInWithOrgBouncycastleCryptoDigestsSHA256Digest:(OrgBouncycastleCryptoDigestsSHA256Digest *)t OBJC_METHOD_FAMILY_NONE;

- (jint)ChWithInt:(jint)x
          withInt:(jint)y
          withInt:(jint)z;

- (jint)MajWithInt:(jint)x
           withInt:(jint)y
           withInt:(jint)z;

- (jint)Sum0WithInt:(jint)x;

- (jint)Sum1WithInt:(jint)x;

- (jint)Theta0WithInt:(jint)x;

- (jint)Theta1WithInt:(jint)x;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoDigestsSHA256Digest, X_, IOSIntArray *)

BOOL OrgBouncycastleCryptoDigestsSHA256Digest_initialized = NO;


#line 19
@implementation OrgBouncycastleCryptoDigestsSHA256Digest

IOSIntArray * OrgBouncycastleCryptoDigestsSHA256Digest_K_;


#line 32
- (instancetype)init {
  if (self = [super init]) {
    X_ = [IOSIntArray newArrayWithLength:
#line 26
    64];
    
#line 33
    [self reset];
  }
  return self;
}


#line 40
- (instancetype)initWithOrgBouncycastleCryptoDigestsSHA256Digest:(OrgBouncycastleCryptoDigestsSHA256Digest *)t {
  if (self =
#line 41
  [super initWithOrgBouncycastleCryptoDigestsGeneralDigest:t]) {
    X_ = [IOSIntArray newArrayWithLength:
#line 26
    64];
    [self copyInWithOrgBouncycastleCryptoDigestsSHA256Digest:t];
  }
  return self;
}


#line 46
- (void)copyInWithOrgBouncycastleCryptoDigestsSHA256Digest:(OrgBouncycastleCryptoDigestsSHA256Digest *)t {
  
#line 47
  [super copyInWithOrgBouncycastleCryptoDigestsGeneralDigest:t];
  
#line 49
  H1_ = ((OrgBouncycastleCryptoDigestsSHA256Digest *) nil_chk(t))->H1_;
  H2_ = t->H2_;
  H3_ = t->H3_;
  H4_ = t->H4_;
  H5_ = t->H5_;
  H6_ = t->H6_;
  H7_ = t->H7_;
  H8_ = t->H8_;
  
#line 58
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(t->X_, 0, X_, 0, ((IOSIntArray *) nil_chk(t->X_))->size_);
  xOff_ = t->xOff_;
}


#line 62
- (instancetype)initWithByteArray:(IOSByteArray *)encodedState {
  if (self =
#line 63
  [super initWithByteArray:encodedState]) {
    X_ = [IOSIntArray newArrayWithLength:
#line 26
    64];
    H1_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 16);
    
#line 66
    H2_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 20);
    
#line 67
    H3_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 24);
    
#line 68
    H4_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 28);
    
#line 69
    H5_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 32);
    
#line 70
    H6_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 36);
    
#line 71
    H7_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 40);
    
#line 72
    H8_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 44);
    
#line 74
    xOff_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 48);
    
#line 75
    for (jint i = 0; i != xOff_; i++) {
      *IOSIntArray_GetRef(X_, i) = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 52 + (i * 4));
    }
  }
  return self;
}


#line 81
- (NSString *)getAlgorithmName {
  
#line 82
  return @"SHA-256";
}


#line 85
- (jint)getDigestSize {
  
#line 86
  return OrgBouncycastleCryptoDigestsSHA256Digest_DIGEST_LENGTH;
}


#line 89
- (void)processWordWithByteArray:(IOSByteArray *)inArg
                         withInt:(jint)inOff {
  
#line 94
  jint n = LShift32(IOSByteArray_Get(nil_chk(inArg), inOff), 24);
  n |= LShift32((IOSByteArray_Get(inArg, ++inOff) & (jint) 0xff), 16);
  n |= LShift32((IOSByteArray_Get(inArg, ++inOff) & (jint) 0xff), 8);
  n |= (IOSByteArray_Get(inArg, ++inOff) & (jint) 0xff);
  *IOSIntArray_GetRef(nil_chk(X_), xOff_) = n;
  
#line 100
  if (++xOff_ == 16) {
    [self processBlock];
  }
}

- (void)processLengthWithLong:(jlong)bitLength {
  
#line 107
  if (xOff_ > 14) {
    [self processBlock];
  }
  
#line 111
  *IOSIntArray_GetRef(nil_chk(X_), 14) = (jint) (URShift64(bitLength, 32));
  *IOSIntArray_GetRef(X_, 15) = (jint) (bitLength & (jint) 0xffffffff);
}


#line 115
- (jint)doFinalWithByteArray:(IOSByteArray *)outArg
                     withInt:(jint)outOff {
  
#line 118
  [self finish];
  
#line 120
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H1_, outArg, outOff);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H2_, outArg, outOff + 4);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H3_, outArg, outOff + 8);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H4_, outArg, outOff + 12);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H5_, outArg, outOff + 16);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H6_, outArg, outOff + 20);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H7_, outArg, outOff + 24);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H8_, outArg, outOff + 28);
  
#line 129
  [self reset];
  
#line 131
  return OrgBouncycastleCryptoDigestsSHA256Digest_DIGEST_LENGTH;
}


#line 137
- (void)reset {
  [super reset];
  
#line 145
  H1_ = (jint) 0x6a09e667;
  H2_ = (jint) 0xbb67ae85;
  H3_ = (jint) 0x3c6ef372;
  H4_ = (jint) 0xa54ff53a;
  H5_ = (jint) 0x510e527f;
  H6_ = (jint) 0x9b05688c;
  H7_ = (jint) 0x1f83d9ab;
  H8_ = (jint) 0x5be0cd19;
  
#line 154
  xOff_ = 0;
  for (jint i = 0; i != ((IOSIntArray *) nil_chk(X_))->size_; i++) {
    *IOSIntArray_GetRef(X_, i) = 0;
  }
}


#line 160
- (void)processBlock {
  
#line 164
  for (jint t = 16; t <= 63; t++) {
    *IOSIntArray_GetRef(nil_chk(X_), t) = OrgBouncycastleCryptoDigestsSHA256Digest_Theta1WithInt_(self, IOSIntArray_Get(X_, t - 2)) + IOSIntArray_Get(X_, t - 7) + OrgBouncycastleCryptoDigestsSHA256Digest_Theta0WithInt_(self, IOSIntArray_Get(X_, t - 15)) + IOSIntArray_Get(X_, t - 16);
  }
  
#line 171
  jint a = H1_;
  jint b = H2_;
  jint c = H3_;
  jint d = H4_;
  jint e = H5_;
  jint f = H6_;
  jint g = H7_;
  jint h = H8_;
  
#line 180
  jint t = 0;
  for (jint i = 0; i < 8; i++) {
    
#line 183
    h += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, e) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, e, f, g) + IOSIntArray_Get(nil_chk(OrgBouncycastleCryptoDigestsSHA256Digest_K_), t) + IOSIntArray_Get(nil_chk(X_), t);
    d += h;
    h += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, a) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, a, b, c);
    ++t;
    
#line 189
    g += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, d) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, d, e, f) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    c += g;
    g += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, h) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, h, a, b);
    ++t;
    
#line 195
    f += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, c) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, c, d, e) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    b += f;
    f += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, g) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, g, h, a);
    ++t;
    
#line 201
    e += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, b) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, b, c, d) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    a += e;
    e += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, f) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, f, g, h);
    ++t;
    
#line 207
    d += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, a) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, a, b, c) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    h += d;
    d += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, e) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, e, f, g);
    ++t;
    
#line 213
    c += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, h) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, h, a, b) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    g += c;
    c += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, d) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, d, e, f);
    ++t;
    
#line 219
    b += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, g) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, g, h, a) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    f += b;
    b += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, c) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, c, d, e);
    ++t;
    
#line 225
    a += OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, f) + OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, f, g, h) + IOSIntArray_Get(OrgBouncycastleCryptoDigestsSHA256Digest_K_, t) + IOSIntArray_Get(X_, t);
    e += a;
    a += OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, b) + OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, b, c, d);
    ++t;
  }
  
#line 231
  H1_ = (H1_ + a) & (jint) 0xffffffff;
  H2_ = (H2_ + b) & (jint) 0xffffffff;
  H3_ = (H3_ + c) & (jint) 0xffffffff;
  H4_ = (H4_ + d) & (jint) 0xffffffff;
  H5_ = (H5_ + e) & (jint) 0xffffffff;
  H6_ = (H6_ + f) & (jint) 0xffffffff;
  H7_ = (H7_ + g) & (jint) 0xffffffff;
  H8_ = (H8_ + h) & (jint) 0xffffffff;
  
#line 243
  xOff_ = 0;
  for (jint i = 0; i < 16; i++) {
    *IOSIntArray_GetRef(nil_chk(X_), i) = 0;
  }
}


#line 250
- (jint)ChWithInt:(jint)x
          withInt:(jint)y
          withInt:(jint)z {
  return OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(self, x, y, z);
}


#line 257
- (jint)MajWithInt:(jint)x
           withInt:(jint)y
           withInt:(jint)z {
  return OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(self, x, y, z);
}


#line 264
- (jint)Sum0WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(self, x);
}


#line 269
- (jint)Sum1WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(self, x);
}


#line 274
- (jint)Theta0WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA256Digest_Theta0WithInt_(self, x);
}


#line 279
- (jint)Theta1WithInt:(jint)x {
  return OrgBouncycastleCryptoDigestsSHA256Digest_Theta1WithInt_(self, x);
}


#line 299
- (id<OrgBouncycastleUtilMemoable>)copy__ {
  
#line 300
  return [[OrgBouncycastleCryptoDigestsSHA256Digest alloc] initWithOrgBouncycastleCryptoDigestsSHA256Digest:self];
}


#line 303
- (void)resetWithOrgBouncycastleUtilMemoable:(id<OrgBouncycastleUtilMemoable>)other {
  
#line 304
  OrgBouncycastleCryptoDigestsSHA256Digest *d = (OrgBouncycastleCryptoDigestsSHA256Digest *) check_class_cast(other, [OrgBouncycastleCryptoDigestsSHA256Digest class]);
  
#line 306
  [self copyInWithOrgBouncycastleCryptoDigestsSHA256Digest:d];
}


#line 309
- (IOSByteArray *)getEncodedState {
  
#line 310
  IOSByteArray *state = [IOSByteArray newArrayWithLength:52 + xOff_ * 4];
  
#line 312
  [super populateStateWithByteArray:state];
  
#line 314
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H1_, state, 16);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H2_, state, 20);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H3_, state, 24);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H4_, state, 28);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H5_, state, 32);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H6_, state, 36);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H7_, state, 40);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(H8_, state, 44);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(xOff_, state, 48);
  
#line 324
  for (jint i = 0; i != xOff_; i++) {
    OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(IOSIntArray_Get(nil_chk(X_), i), state, 52 + (i * 4));
  }
  
#line 328
  return state;
}

- (void)copyAllFieldsTo:(OrgBouncycastleCryptoDigestsSHA256Digest *)other {
  [super copyAllFieldsTo:other];
  other->H1_ = H1_;
  other->H2_ = H2_;
  other->H3_ = H3_;
  other->H4_ = H4_;
  other->H5_ = H5_;
  other->H6_ = H6_;
  other->H7_ = H7_;
  other->H8_ = H8_;
  other->X_ = X_;
  other->xOff_ = xOff_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleCryptoDigestsSHA256Digest class]) {
    OrgBouncycastleCryptoDigestsSHA256Digest_K_ = [IOSIntArray newArrayWithInts:(jint[]){
#line 289
      (jint) 0x428a2f98, (jint) 0x71374491, (jint) 0xb5c0fbcf, (jint) 0xe9b5dba5, (jint) 0x3956c25b, (jint) 0x59f111f1, (jint) 0x923f82a4, (jint) 0xab1c5ed5,
#line 290
      (jint) 0xd807aa98, (jint) 0x12835b01, (jint) 0x243185be, (jint) 0x550c7dc3, (jint) 0x72be5d74, (jint) 0x80deb1fe, (jint) 0x9bdc06a7, (jint) 0xc19bf174,
#line 291
      (jint) 0xe49b69c1, (jint) 0xefbe4786, (jint) 0x0fc19dc6, (jint) 0x240ca1cc, (jint) 0x2de92c6f, (jint) 0x4a7484aa, (jint) 0x5cb0a9dc, (jint) 0x76f988da,
#line 292
      (jint) 0x983e5152, (jint) 0xa831c66d, (jint) 0xb00327c8, (jint) 0xbf597fc7, (jint) 0xc6e00bf3, (jint) 0xd5a79147, (jint) 0x06ca6351, (jint) 0x14292967,
#line 293
      (jint) 0x27b70a85, (jint) 0x2e1b2138, (jint) 0x4d2c6dfc, (jint) 0x53380d13, (jint) 0x650a7354, (jint) 0x766a0abb, (jint) 0x81c2c92e, (jint) 0x92722c85,
#line 294
      (jint) 0xa2bfe8a1, (jint) 0xa81a664b, (jint) 0xc24b8b70, (jint) 0xc76c51a3, (jint) 0xd192e819, (jint) 0xd6990624, (jint) 0xf40e3585, (jint) 0x106aa070,
#line 295
      (jint) 0x19a4c116, (jint) 0x1e376c08, (jint) 0x2748774c, (jint) 0x34b0bcb5, (jint) 0x391c0cb3, (jint) 0x4ed8aa4a, (jint) 0x5b9cca4f, (jint) 0x682e6ff3,
#line 296
      (jint) 0x748f82ee, (jint) 0x78a5636f, (jint) 0x84c87814, (jint) 0x8cc70208, (jint) 0x90befffa, (jint) 0xa4506ceb, (jint) 0xbef9a3f7, (jint) 0xc67178f2 } count:64];
      J2OBJC_SET_INITIALIZED(OrgBouncycastleCryptoDigestsSHA256Digest)
    }
  }

@end

jint OrgBouncycastleCryptoDigestsSHA256Digest_ChWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x, jint y, jint z) {
  
#line 254
  return (x & y) ^ ((~x) & z);
}

jint OrgBouncycastleCryptoDigestsSHA256Digest_MajWithInt_withInt_withInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x, jint y, jint z) {
  
#line 261
  return (x & y) ^ (x & z) ^ (y & z);
}

jint OrgBouncycastleCryptoDigestsSHA256Digest_Sum0WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x) {
  
#line 266
  return ((URShift32(x, 2)) | (LShift32(x, 30))) ^ ((URShift32(x, 13)) | (LShift32(x, 19))) ^ ((URShift32(x, 22)) | (LShift32(x, 10)));
}

jint OrgBouncycastleCryptoDigestsSHA256Digest_Sum1WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x) {
  
#line 271
  return ((URShift32(x, 6)) | (LShift32(x, 26))) ^ ((URShift32(x, 11)) | (LShift32(x, 21))) ^ ((URShift32(x, 25)) | (LShift32(x, 7)));
}

jint OrgBouncycastleCryptoDigestsSHA256Digest_Theta0WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x) {
  
#line 276
  return ((URShift32(x, 7)) | (LShift32(x, 25))) ^ ((URShift32(x, 18)) | (LShift32(x, 14))) ^ (URShift32(x, 3));
}

jint OrgBouncycastleCryptoDigestsSHA256Digest_Theta1WithInt_(OrgBouncycastleCryptoDigestsSHA256Digest *self, jint x) {
  
#line 281
  return ((URShift32(x, 17)) | (LShift32(x, 15))) ^ ((URShift32(x, 19)) | (LShift32(x, 13))) ^ (URShift32(x, 10));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoDigestsSHA256Digest)