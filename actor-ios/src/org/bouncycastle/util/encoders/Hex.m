//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/util/encoders/Hex.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/ByteArrayOutputStream.h"
#include "java/io/IOException.h"
#include "java/io/OutputStream.h"
#include "java/lang/Exception.h"
#include "org/bouncycastle/util/Strings.h"
#include "org/bouncycastle/util/encoders/DecoderException.h"
#include "org/bouncycastle/util/encoders/Encoder.h"
#include "org/bouncycastle/util/encoders/EncoderException.h"
#include "org/bouncycastle/util/encoders/Hex.h"
#include "org/bouncycastle/util/encoders/HexEncoder.h"

@interface OrgBouncycastleUtilEncodersHex () {
}
@end

BOOL OrgBouncycastleUtilEncodersHex_initialized = NO;

@implementation OrgBouncycastleUtilEncodersHex

id<OrgBouncycastleUtilEncodersEncoder> OrgBouncycastleUtilEncodersHex_encoder_;

+ (NSString *)toHexStringWithByteArray:(IOSByteArray *)data {
  return OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_(data);
}

+ (NSString *)toHexStringWithByteArray:(IOSByteArray *)data
                               withInt:(jint)off
                               withInt:(jint)length {
  return OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_withInt_withInt_(data, off, length);
}

+ (IOSByteArray *)encodeWithByteArray:(IOSByteArray *)data {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_(data);
}

+ (IOSByteArray *)encodeWithByteArray:(IOSByteArray *)data
                              withInt:(jint)off
                              withInt:(jint)length {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(data, off, length);
}

+ (jint)encodeWithByteArray:(IOSByteArray *)data
     withJavaIoOutputStream:(JavaIoOutputStream *)outArg {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withJavaIoOutputStream_(data, outArg);
}

+ (jint)encodeWithByteArray:(IOSByteArray *)data
                    withInt:(jint)off
                    withInt:(jint)length
     withJavaIoOutputStream:(JavaIoOutputStream *)outArg {
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_withJavaIoOutputStream_(data, off, length, outArg);
}

+ (IOSByteArray *)decodeWithByteArray:(IOSByteArray *)data {
  return OrgBouncycastleUtilEncodersHex_decodeWithByteArray_(data);
}

+ (IOSByteArray *)decodeWithNSString:(NSString *)data {
  return OrgBouncycastleUtilEncodersHex_decodeWithNSString_(data);
}

+ (jint)decodeWithNSString:(NSString *)data
    withJavaIoOutputStream:(JavaIoOutputStream *)outArg {
  return OrgBouncycastleUtilEncodersHex_decodeWithNSString_withJavaIoOutputStream_(data, outArg);
}

- (instancetype)init {
  return [super init];
}

+ (void)initialize {
  if (self == [OrgBouncycastleUtilEncodersHex class]) {
    OrgBouncycastleUtilEncodersHex_encoder_ = [[OrgBouncycastleUtilEncodersHexEncoder alloc] init];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleUtilEncodersHex)
  }
}

@end

NSString *OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_(IOSByteArray *data) {
  OrgBouncycastleUtilEncodersHex_init();
  return OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_withInt_withInt_(data, 0, ((IOSByteArray *) nil_chk(data))->size_);
}

NSString *OrgBouncycastleUtilEncodersHex_toHexStringWithByteArray_withInt_withInt_(IOSByteArray *data, jint off, jint length) {
  OrgBouncycastleUtilEncodersHex_init();
  IOSByteArray *encoded = OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(data, off, length);
  return OrgBouncycastleUtilStrings_fromByteArrayWithByteArray_(encoded);
}

IOSByteArray *OrgBouncycastleUtilEncodersHex_encodeWithByteArray_(IOSByteArray *data) {
  OrgBouncycastleUtilEncodersHex_init();
  return OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(data, 0, ((IOSByteArray *) nil_chk(data))->size_);
}

IOSByteArray *OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_(IOSByteArray *data, jint off, jint length) {
  OrgBouncycastleUtilEncodersHex_init();
  JavaIoByteArrayOutputStream *bOut = [[JavaIoByteArrayOutputStream alloc] init];
  @try {
    [((id<OrgBouncycastleUtilEncodersEncoder>) nil_chk(OrgBouncycastleUtilEncodersHex_encoder_)) encodeWithByteArray:data withInt:off withInt:length withJavaIoOutputStream:bOut];
  }
  @catch (JavaLangException *e) {
    @throw [[OrgBouncycastleUtilEncodersEncoderException alloc] initWithNSString:JreStrcat("$$", @"exception encoding Hex string: ", [((JavaLangException *) nil_chk(e)) getMessage]) withJavaLangThrowable:e];
  }
  return [bOut toByteArray];
}

jint OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withJavaIoOutputStream_(IOSByteArray *data, JavaIoOutputStream *outArg) {
  OrgBouncycastleUtilEncodersHex_init();
  return [((id<OrgBouncycastleUtilEncodersEncoder>) nil_chk(OrgBouncycastleUtilEncodersHex_encoder_)) encodeWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_ withJavaIoOutputStream:outArg];
}

jint OrgBouncycastleUtilEncodersHex_encodeWithByteArray_withInt_withInt_withJavaIoOutputStream_(IOSByteArray *data, jint off, jint length, JavaIoOutputStream *outArg) {
  OrgBouncycastleUtilEncodersHex_init();
  return [((id<OrgBouncycastleUtilEncodersEncoder>) nil_chk(OrgBouncycastleUtilEncodersHex_encoder_)) encodeWithByteArray:data withInt:off withInt:length withJavaIoOutputStream:outArg];
}

IOSByteArray *OrgBouncycastleUtilEncodersHex_decodeWithByteArray_(IOSByteArray *data) {
  OrgBouncycastleUtilEncodersHex_init();
  JavaIoByteArrayOutputStream *bOut = [[JavaIoByteArrayOutputStream alloc] init];
  @try {
    [((id<OrgBouncycastleUtilEncodersEncoder>) nil_chk(OrgBouncycastleUtilEncodersHex_encoder_)) decodeWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_ withJavaIoOutputStream:bOut];
  }
  @catch (JavaLangException *e) {
    @throw [[OrgBouncycastleUtilEncodersDecoderException alloc] initWithNSString:JreStrcat("$$", @"exception decoding Hex data: ", [((JavaLangException *) nil_chk(e)) getMessage]) withJavaLangThrowable:e];
  }
  return [bOut toByteArray];
}

IOSByteArray *OrgBouncycastleUtilEncodersHex_decodeWithNSString_(NSString *data) {
  OrgBouncycastleUtilEncodersHex_init();
  JavaIoByteArrayOutputStream *bOut = [[JavaIoByteArrayOutputStream alloc] init];
  @try {
    [((id<OrgBouncycastleUtilEncodersEncoder>) nil_chk(OrgBouncycastleUtilEncodersHex_encoder_)) decodeWithNSString:data withJavaIoOutputStream:bOut];
  }
  @catch (JavaLangException *e) {
    @throw [[OrgBouncycastleUtilEncodersDecoderException alloc] initWithNSString:JreStrcat("$$", @"exception decoding Hex string: ", [((JavaLangException *) nil_chk(e)) getMessage]) withJavaLangThrowable:e];
  }
  return [bOut toByteArray];
}

jint OrgBouncycastleUtilEncodersHex_decodeWithNSString_withJavaIoOutputStream_(NSString *data, JavaIoOutputStream *outArg) {
  OrgBouncycastleUtilEncodersHex_init();
  return [((id<OrgBouncycastleUtilEncodersEncoder>) nil_chk(OrgBouncycastleUtilEncodersHex_encoder_)) decodeWithNSString:data withJavaIoOutputStream:outArg];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleUtilEncodersHex)