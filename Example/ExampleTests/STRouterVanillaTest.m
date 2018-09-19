//
//  STRouterVanillaTest.m
//  ExampleTests
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "STRouterBaseTests.h"

@interface STRouterVanillaTest : STRouterBaseTests

@end

@implementation STRouterVanillaTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end




@interface STRouterVanillaTest (InstanceMethod)

@end

@implementation STRouterVanillaTest (InstanceMethod)
// test >> return value
- (void)testInstanceMethod_voidReturnValueMethod
{
    NSString *selName = @"voidReturnValueMethod";
    XCTestExpectation *exp = [self expectationForNotification:selName object:nil handler:^BOOL(NSNotification * _Nonnull notification) {
        NSLog(@"%@", notification);
        return YES;
    }];
    [[STRouter router] st_performAction:selName target:self.targetNameA shouldCacheTarget:NO params:nil];
    [self waitForExpectations:@[exp] timeout:6.f];
}

- (void)testInstanceMethod_CGFloatReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performAction:@"CGFloatReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    XCTAssert(value.doubleValue == self.tmpA.CGFloatReturnValueMethod, @"调用异常");
}

- (void)testInstanceMethod_CGSizeReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performAction:@"CGSizeReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    XCTAssert(CGSizeEqualToSize(value.sizeValue, self.tmpA.CGSizeReturnValueMethod) , @"调用异常");
}

- (void)testInstanceMethod_CGPointReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performAction:@"CGPointReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    XCTAssert(CGPointEqualToPoint(value.pointValue, self.tmpA.CGPointReturnValueMethod) , @"调用异常");
}

- (void)testInstanceMethod_CGRectReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performAction:@"CGRectReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    XCTAssert(CGRectEqualToRect(value.rectValue, self.tmpA.CGRectReturnValueMethod) , @"调用异常");
}

- (void)testInstanceMethod_NSIntegerReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performAction:@"NSIntegerReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    // iOS都是64位了，不复杂化
    XCTAssert(value.longValue == self.tmpA.NSIntegerReturnValueMethod, @"调用异常");
}

- (void)testInstanceMethod_NSUIntegerReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performAction:@"NSUIntegerReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    // iOS都是64位了，不复杂化
    XCTAssert(value.unsignedLongValue == self.tmpA.NSUIntegerReturnValueMethod, @"调用异常");
}

- (void)testInstanceMethod_idReturnValueMethod
{
    id obj = [[STRouter router] st_performAction:@"idReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    // 由于NSObject的isEqual方法。。。，采用迂回策略
    XCTAssert(KSZCClassEqualToClass([obj class], [self.tmpA.idReturnValueMethod class]), @"调用异常");
}

- (void)testInstanceMethod_ClassReturnValueMethod
{
    Class cls = (Class)[[STRouter router] st_performAction:@"ClassReturnValueMethod" target:self.targetNameA shouldCacheTarget:NO params:nil];
    XCTAssert(KSZCClassEqualToClass(cls, self.tmpA.ClassReturnValueMethod), @"调用异常");
}

- (void)testInstanceMethod_blockReturnValueMethod
{
    NSString *selName = @"blockReturnValueMethod";
    XCTestExpectation *exp0 = [self expectationForNotification:selName object:nil handler:^BOOL(NSNotification * _Nonnull notification) {
        NSLog(@"%@", notification);
        return YES;
    }];
    void(^tmp)(NSString *) = (void(^)(NSString *))[[STRouter router] st_performAction:selName target:self.targetNameA shouldCacheTarget:NO params:nil];
    NSString *ret = @"qwer";
    __weak typeof(ret) wret = ret;
    XCTestExpectation *exp1 = [self expectationForNotification:@"qwer" object:ret handler:^BOOL(NSNotification * _Nonnull notification) {
        NSLog(@"!!%@", notification.object);
        NSLog(@"!!!%@", wret);
        NSString *tmp = (NSString *)notification.object;
        XCTAssert([tmp isEqualToString:wret], @"调用异常");
        return YES;
    }];
    tmp(ret);
    [self waitForExpectations:@[exp0, exp1] timeout:6.f];
    
}

@end



@interface STRouterVanillaTest (ClassMethod)

@end

@implementation STRouterVanillaTest (ClassMethod)

// test >> return value
- (void)testClassMethod_voidReturnValueMethod
{
    NSString *selName = @"class_voidReturnValueMethod";
    XCTestExpectation *exp = [self expectationForNotification:selName object:nil handler:^BOOL(NSNotification * _Nonnull notification) {
        NSLog(@"%@", notification);
        return YES;
    }];
    [[STRouter router] st_performClassAction:selName target:self.targetNameA params:nil];
    [self waitForExpectations:@[exp] timeout:6.f];
}

- (void)testClassMethod_CGFloatReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performClassAction:@"class_CGFloatReturnValueMethod" target:self.targetNameA params:nil];
    XCTAssert(value.doubleValue == ModuleA.class_CGFloatReturnValueMethod, @"调用异常");
}

- (void)testClassMethod_CGSizeReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performClassAction:@"class_CGSizeReturnValueMethod" target:self.targetNameA params:nil];
    XCTAssert(CGSizeEqualToSize(value.sizeValue, ModuleA.class_CGSizeReturnValueMethod) , @"调用异常");
}

- (void)testClassMethod_CGPointReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performClassAction:@"class_CGPointReturnValueMethod" target:self.targetNameA params:nil];
    XCTAssert(CGPointEqualToPoint(value.pointValue, ModuleA.class_CGPointReturnValueMethod) , @"调用异常");
}

- (void)testClassMethod_CGRectReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performClassAction:@"class_CGRectReturnValueMethod" target:self.targetNameA params:nil];
    XCTAssert(CGRectEqualToRect(value.rectValue, ModuleA.class_CGRectReturnValueMethod) , @"调用异常");
}

- (void)testClassMethod_NSIntegerReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performClassAction:@"class_NSIntegerReturnValueMethod" target:self.targetNameA params:nil];
    // iOS都是64位了，不复杂化
    XCTAssert(value.longValue == ModuleA.class_NSIntegerReturnValueMethod, @"调用异常");
}

- (void)testClassMethod_NSUIntegerReturnValueMethod
{
    STRouterValue *value = [[STRouter router] st_performClassAction:@"class_NSUIntegerReturnValueMethod" target:self.targetNameA params:nil];
    // iOS都是64位了，不复杂化
    XCTAssert(value.unsignedLongValue == ModuleA.class_NSUIntegerReturnValueMethod, @"调用异常");
}

- (void)testClassMethod_idReturnValueMethod
{
    id obj = [[STRouter router] st_performClassAction:@"class_idReturnValueMethod" target:self.targetNameA params:nil];
    // 由于NSObject的isEqual方法。。。，采用迂回策略
    XCTAssert(KSZCClassEqualToClass([obj class], [ModuleA.class_idReturnValueMethod class]), @"调用异常");
}

- (void)testClassMethod_ClassReturnValueMethod
{
    Class cls = (Class)[[STRouter router] st_performClassAction:@"class_ClassReturnValueMethod" target:self.targetNameA params:nil];
    XCTAssert(KSZCClassEqualToClass(cls, ModuleA.class_ClassReturnValueMethod), @"调用异常");
}

- (void)testClassMethod_blockReturnValueMethod
{
    NSString *selName = @"class_blockReturnValueMethod";
    XCTestExpectation *exp0 = [self expectationForNotification:selName object:nil handler:^BOOL(NSNotification * _Nonnull notification) {
        NSLog(@"%@", notification);
        return YES;
    }];
    void(^tmp)(NSString *) = (void(^)(NSString *))[[STRouter router] st_performClassAction:selName target:self.targetNameA params:nil];
    NSString *ret = @"qwer";
    __weak typeof(ret) wret = ret;
    XCTestExpectation *exp1 = [self expectationForNotification:@"qwer" object:ret handler:^BOOL(NSNotification * _Nonnull notification) {
        NSLog(@"!!%@", notification.object);
        NSLog(@"!!!%@", wret);
        NSString *tmp = (NSString *)notification.object;
        XCTAssert([tmp isEqualToString:wret], @"调用异常");
        return YES;
    }];
    tmp(ret);
    [self waitForExpectations:@[exp0, exp1] timeout:6.f];
    
}
@end


@interface STRouterVanillaTest (MultipleArguments)

@end

@implementation STRouterVanillaTest (MultipleArguments)
- (void)testMA_instance
{
    NSString *selName = @"aaa:bbb:ccc:ddd:eee:fff:";
    NSString *param0 = @"要要切克闹";
    NSInteger param1 = 66;
    NSArray *param2 = @[@"一百遍啊一百遍"];
    CGSize param3 = CGSizeMake(12.f, 32.f);
    CGRect param4 = CGRectMake(12.f, 32.f, 32.f, 12.f);
    void (^param5)(NSString *) = ^(NSString *str) {
        XCTAssert([param0 isEqualToString:str], @"block参数调用异常");
    };
    XCTestExpectation *exp = [self expectationForNotification:selName object:nil handler:nil];
    [[STRouter router] st_performAction:selName target:self.targetNameA shouldCacheTarget:NO params:&param0, &param1, &param2, &param3, &param4, &param5, nil];
    [self waitForExpectations:@[exp] timeout:6.f];
}

@end

