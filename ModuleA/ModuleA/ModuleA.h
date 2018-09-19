//
//  ModuleA.h
//  ModuleA
//
//  Created by 王铎睿 on 2018/5/2.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleA : NSObject
@property (nonatomic, assign) CGFloat width;
- (void)aaa;
- (CGFloat)bbb;

- (NSArray *)qwer:(NSString *)sss aaa:(NSString *)aaa;

@property (nonatomic, strong) NSString *blockReturnValueMethodHoldString;
@end

@interface ModuleA (ReturnValue)
// !!!: instance
- (void)voidReturnValueMethod;
- (CGFloat)CGFloatReturnValueMethod;
- (CGSize)CGSizeReturnValueMethod;
- (CGPoint)CGPointReturnValueMethod;
- (CGRect)CGRectReturnValueMethod;
- (NSInteger)NSIntegerReturnValueMethod;
- (NSUInteger)NSUIntegerReturnValueMethod;
- (id)idReturnValueMethod;
- (Class)ClassReturnValueMethod;
- (void(^)(NSString *))blockReturnValueMethod;
//- (<#type#>)<#type#>ReturnValueMethod;

// !!!: class
+ (void)class_voidReturnValueMethod;
+ (CGFloat)class_CGFloatReturnValueMethod;
+ (CGSize)class_CGSizeReturnValueMethod;
+ (CGPoint)class_CGPointReturnValueMethod;
+ (CGRect)class_CGRectReturnValueMethod;
+ (NSInteger)class_NSIntegerReturnValueMethod;
+ (NSUInteger)class_NSUIntegerReturnValueMethod;
+ (id)class_idReturnValueMethod;
+ (Class)class_ClassReturnValueMethod;
+ (void(^)(NSString *))class_blockReturnValueMethod;
@end

@interface ModuleA (MultipleArguments)
- (void)aaa:(NSString *)aaa bbb:(NSInteger)bbb ccc:(NSArray *)ccc ddd:(CGSize)ddd eee:(CGRect)eee fff:(void (^)(NSString *))fff;
@end
