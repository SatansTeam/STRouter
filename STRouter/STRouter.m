//
//  STRouter.m
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "STRouter.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
void * STRouterBridgingRetain(id _Nullable X) {
    CFBridgingRetain(X);
    void *aaa = malloc(sizeof(&X));
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wsizeof-pointer-memaccess"
#pragma clang diagnostic ignored "-Warc-non-pod-memaccess"
    memcpy(aaa, &X, sizeof(&X));
#pragma clang diagnostic pop
    return aaa;
}
#pragma clang diagnostic pop

@interface STRouter ()

/**
 *  缓存的目标对象，cell等
 *  @note   Class 不要 cache !!!
 */
@property (nonatomic, strong) NSMutableDictionary *cachedTargets;
@end

@implementation STRouter
+ (instancetype)router
{
    static STRouter *router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = STRouter.new;
    });
    return router;
}

- (void)removeCachedTarget:(NSString *)targetName
{
    if (![self.cachedTargets.allKeys containsObject:targetName]) return;
    [self.cachedTargets removeObjectForKey:targetName];
}


// !!!: getters and setters
- (NSMutableDictionary *)cachedTargets
{
    if (_cachedTargets == nil) {
        _cachedTargets = [@{} mutableCopy];
    }
    return _cachedTargets;
}
@end

#import "STRouterPreHeader.h"
#import "NSObject+STPrivateness.h"

@implementation STRouter (Vanilla)
// !!!: obj
- (id)st_performAction:(NSString *)actionName target:(NSString *)targetName
{
    return [self st_performAction:actionName target:targetName shouldCacheTarget:NO params:nil];
}

- (id)st_performAction:(NSString *)actionName target:(NSString *)targetName shouldCacheTarget:(BOOL)shouldCacheTarget  params:(void *)params, ...
{
    // 验证 target class 是有存在
    Class targetClass = NSClassFromString(targetName);// NSClassFromString() 等同于 objc_lookUpClass()
    if (!targetClass) STRouterLog(@"%@", [NSThread callStackSymbols]);
    NSAssert(targetClass, @"类目 [%@] 不存在", targetName);
    if (!targetClass) return nil;
    
    // FIXME: 可优化，extract method
    NSObject *target = self.cachedTargets[targetName];
    if (!target) {
        target = targetClass.new;
    }
    // FIXME: 可优化，extract macro
    if (!target) STRouterLog(@"%@", [NSThread callStackSymbols]);
    NSAssert(target, @"类目 [%@] 的实例无法捕获", target);
    if (!target) return nil;
    
    // 验证 action 能否响应
    SEL action = NSSelectorFromString(actionName);
    NSAssert([target respondsToSelector:action], @"类目 [%@] 的实例不响应函数 >> %@", targetName, actionName);
    if ([target respondsToSelector:action]) {
        NSInvocation *invocation = [target st_getInvocationSelector:action];
        // 处理action无参数，params传nil或NULL情况
        if (invocation.methodSignature.numberOfArguments <= 2) return [self st_invokeSelector:invocation];
        va_list args; // 定义一个指向个数可变的参数列表指针；
        va_start(args, params);
        [self configInvocation:invocation params:params args:args];
        va_end(args); // 清空参数列表，并置参数指针args无效。
//        return [self st_invokeSelector:invocation];
        id result = [self st_invokeSelector:invocation];
        STRouterBridgingRetain(result);
        return result;
    }
    return nil;
}

// !!!: class
- (id)st_performClassAction:(NSString *)actionName target:(NSString *)targetName
{
    return [self st_performClassAction:actionName target:targetName params:nil];
}

- (id)st_performClassAction:(NSString *)actionName target:(NSString *)targetName params:(void *)params, ...
{
    // 验证 target class 是有存在
    Class target = NSClassFromString(targetName);// NSClassFromString() 等同于 objc_lookUpClass()
    if (!target) STRouterLog(@"%@", [NSThread callStackSymbols]);
    NSAssert(target, @"类目 [%@] 不存在", targetName);
    if (!target) return nil;
    
    // 验证 action 能否响应
    SEL action = NSSelectorFromString(actionName);
    NSAssert([target respondsToSelector:action], @"类目 [%@] 的实例不响应函数 >> %@", targetName, actionName);
    if ([target respondsToSelector:action]) {
        NSInvocation *invocation = [target st_getInvocationSelector:action];
        // 处理action无参数，params传nil或NULL情况
        if (invocation.methodSignature.numberOfArguments <= 2) return [self st_invokeSelector:invocation];
        va_list args; // 定义一个指向个数可变的参数列表指针；
        va_start(args, params);
        [self configInvocation:invocation params:params args:args];
        va_end(args); // 清空参数列表，并置参数指针args无效。
        return [self st_invokeSelector:invocation];
    }
    return nil;
}
@end


