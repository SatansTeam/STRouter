//
//  STRouterValue.m
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "STRouterValue.h"

@interface STRouterValue()
@property (nonatomic, strong) NSValue *val;
@property (nonatomic, assign) NSUInteger valueLength;
@end

@implementation STRouterValue
- (instancetype)initWithValue:(NSValue *)value valueLength:(NSUInteger)length
{
    self = [super init];
    if (self) {
        self.val = value;
        self.valueLength = length;
    }
    return self;
}

// !!!: Get a scalar value from NSValue
- (char)charValue
{
    if(strcmp(self.val.objCType, @encode(char)) == 0) {
        char result;
        [self.val getValue:&result];
        return result;
    }
    return CHAR_MIN;
}

- (BOOL)boolValue
{
    if(strcmp(self.val.objCType, @encode(BOOL)) == 0) {
        BOOL result;
        [self.val getValue:&result];
        return result;
    }
    return NO;
}

- (double)doubleValue
{
    if(strcmp(self.val.objCType, @encode(double)) == 0) {
        double result;
        [self.val getValue:&result];
        return result;
    }
    return DBL_MIN;
}

- (float)floatValue
{
    if(strcmp(self.val.objCType, @encode(float)) == 0) {
        float result;
        [self.val getValue:&result];
        return result;
    }
    return FLT_MIN;
}

- (int)intValue
{
    if(strcmp(self.val.objCType, @encode(int)) == 0) {
        int result;
        [self.val getValue:&result];
        return result;
    }
    return INT_MIN;
}

- (long)longValue
{
    if(strcmp(self.val.objCType, @encode(long)) == 0) {
        long result;
        [self.val getValue:&result];
        return result;
    }
    return LONG_MIN;
}

- (long long)longLongValue
{
    if(strcmp(self.val.objCType, @encode(long long)) == 0) {
        long long result;
        [self.val getValue:&result];
        return result;
    }
    return LONG_LONG_MIN;
}

- (short)shortValue
{
    if(strcmp(self.val.objCType, @encode(short)) == 0) {
        short result;
        [self.val getValue:&result];
        return result;
    }
    return (short)INT_MIN; // -32768
}

- (unsigned char)unsignedCharValue
{
    if(strcmp(self.val.objCType, @encode(unsigned char)) == 0) {
        unsigned char result;
        [self.val getValue:&result];
        return result;
    }
    return (unsigned char)0;// 0~255
}

- (unsigned int)unsignedIntValue
{
    if(strcmp(self.val.objCType, @encode(unsigned int)) == 0) {
        unsigned int result;
        [self.val getValue:&result];
        return result;
    }
    return (unsigned int)0;
}

- (unsigned long)unsignedLongValue
{
    if(strcmp(self.val.objCType, @encode(unsigned long)) == 0) {
        unsigned long result;
        [self.val getValue:&result];
        return result;
    }
    return (unsigned long)0;
}

- (unsigned long long)unsignedLongLongValue
{
    if(strcmp(self.val.objCType, @encode(unsigned long long)) == 0) {
        unsigned long long result;
        [self.val getValue:&result];
        return result;
    }
    return (unsigned long long)0;
}

- (unsigned short)unsignedShortValue
{
    if(strcmp(self.val.objCType, @encode(unsigned short)) == 0) {
        unsigned short result;
        [self.val getValue:&result];
        return result;
    }
    return (unsigned short)0;
}



// !!!: Get a struct value from NSValue. (UIGeometryExtensions)
- (CGPoint)pointValue
{
    return self.val.CGPointValue;
}

- (CGVector)vectorValue
{
    return self.val.CGVectorValue;
}

- (CGSize)sizeValue
{
    return self.val.CGSizeValue;
}

- (CGRect)rectValue
{
    return self.val.CGRectValue;
}

- (CGAffineTransform)affineTransformValue
{
    return self.val.CGAffineTransformValue;
}

- (UIEdgeInsets)edgeInsetsValue
{
    return self.val.UIEdgeInsetsValue;
}

- (NSDirectionalEdgeInsets)directionalEdgeInsetsValue
{
    return self.val.directionalEdgeInsetsValue;
}

- (UIOffset)offsetValue
{
    return self.val.UIOffsetValue;
}

// !!!: Swift Struct
@end
