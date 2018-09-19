//
//  STRouterValue.h
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STRouterValue : NSObject
- (instancetype)initWithValue:(NSValue *)value valueLength:(NSUInteger)length;

// !!!: Get a scalar value from NSValue
- (char)charValue;
- (BOOL)boolValue;
- (double)doubleValue;
- (float)floatValue;
- (int)intValue;
- (long)longValue;
- (long long)longLongValue;
- (short)shortValue;
- (unsigned char)unsignedCharValue;
- (unsigned int)unsignedIntValue;
- (unsigned long)unsignedLongValue;
- (unsigned long long)unsignedLongLongValue;
- (unsigned short)unsignedShortValue;

// !!!: Get a struct value from NSValue.
- (CGPoint)pointValue;
- (CGVector)vectorValue;
- (CGSize)sizeValue;
- (CGRect)rectValue;
- (CGAffineTransform)affineTransformValue;
- (UIEdgeInsets)edgeInsetsValue;
- (NSDirectionalEdgeInsets)directionalEdgeInsetsValue API_AVAILABLE(ios(11.0),tvos(11.0),watchos(4.0));
- (UIOffset)offsetValue NS_AVAILABLE_IOS(5_0);
@end
