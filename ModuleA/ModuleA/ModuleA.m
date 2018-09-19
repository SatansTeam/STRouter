//
//  ModuleA.m
//  ModuleA
//
//  Created by 王铎睿 on 2018/5/2.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "ModuleA.h"
@interface TestClassA: NSObject

@end

@implementation TestClassA

@end

@implementation ModuleA
// !!!: instance
- (void)aaa
{
    return;
}

- (CGFloat)bbb
{
    return 12.f;
}

- (CGSize)ccc
{
    return CGSizeMake(12.f, 12.f);
}

- (instancetype)ddd
{
    return self.class.new;
}

- (id)eee
{
    return [UIColor redColor];
}

- (id)eee1:(NSString *)str
{
    return [UIColor redColor];
}

- (id)eee2:(NSDictionary *)str
{
    return [UIColor redColor];
}

- (id)fff
{
    return TestClassA.new;
}

- (Class)ggg
{
    return TestClassA.class;
}

- (void (^)(void))hhh
{
    return ^(){
        
    };
}

- (NSSet *)iii
{
    return NSSet.new;
}

- (NSArray *)jjj
{
    return NSArray.new;
}

- (NSDictionary *)kkk
{
    return NSDictionary.new;
}

- (NSArray *)qwer:(NSString *)sss
{
    return NSArray.new;
}

- (NSArray *)qwer:(NSString *)sss aaa:(NSString *)aaa
{
    NSString *a = [sss stringByAppendingString:sss];
    return NSArray.new;
}

- (void)setWidth:(CGFloat)width
{
    
}
@end

@implementation ModuleA (ReturnValue)
- (void)voidReturnValueMethod
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromSelector(_cmd) object:nil];
}

- (CGFloat)CGFloatReturnValueMethod
{
    return 12.f;
}

- (CGSize)CGSizeReturnValueMethod
{
    return CGSizeMake(12.f, 13.f);
}

- (CGPoint)CGPointReturnValueMethod
{
    return CGPointMake(33.f, 36.f);
}

- (CGRect)CGRectReturnValueMethod
{
    return CGRectMake(12.f, 12.f, 33.f, 33.f);
}

- (NSInteger)NSIntegerReturnValueMethod
{
    return 99;
}

- (NSUInteger)NSUIntegerReturnValueMethod
{
    return 88;
}

- (id)idReturnValueMethod
{
    return TestClassA.new;
}

- (Class)ClassReturnValueMethod
{
    return TestClassA.class;
}

- (void(^)(NSString *))blockReturnValueMethod
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromSelector(_cmd) object:nil];
    return ^(NSString *tmp) {
        [[NSNotificationCenter defaultCenter] postNotificationName:tmp object:tmp];
    };
}


// !!!: class
+ (void)class_voidReturnValueMethod
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromSelector(_cmd) object:nil];
}

+ (CGFloat)class_CGFloatReturnValueMethod
{
    return 12.f;
}

+ (CGSize)class_CGSizeReturnValueMethod
{
    return CGSizeMake(12.f, 13.f);
}

+ (CGPoint)class_CGPointReturnValueMethod
{
    return CGPointMake(33.f, 36.f);
}

+ (CGRect)class_CGRectReturnValueMethod
{
    return CGRectMake(12.f, 12.f, 33.f, 33.f);
}

+ (NSInteger)class_NSIntegerReturnValueMethod
{
    return 99;
}

+ (NSUInteger)class_NSUIntegerReturnValueMethod
{
    return 88;
}

+ (id)class_idReturnValueMethod
{
    return TestClassA.new;
}

+ (Class)class_ClassReturnValueMethod
{
    return TestClassA.class;
}

+ (void(^)(NSString *))class_blockReturnValueMethod
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromSelector(_cmd) object:nil];
    return ^(NSString *tmp) {
        [[NSNotificationCenter defaultCenter] postNotificationName:tmp object:tmp];
    };
}

@end

@implementation ModuleA (MultipleArguments)
- (void)aaa:(NSString *)aaa bbb:(NSInteger)bbb ccc:(NSArray *)ccc ddd:(CGSize)ddd eee:(CGRect)eee fff:(void (^)(NSString *))fff
{
    fff(aaa);
    [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromSelector(_cmd) object:nil];
}
@end
