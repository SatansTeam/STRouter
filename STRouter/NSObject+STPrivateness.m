//
//  NSObject+STPrivateness.m
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "NSObject+STPrivateness.h"
#import "STRouterValue.h"
#import "STRouterPreHeader.h"

@implementation NSObject (STPrivateness)
- (NSInvocation *)st_getInvocationSelector:(SEL)aSelector
{
    if (!aSelector) return nil;
    NSMethodSignature *methodSign = [self methodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
    [invocation setSelector:aSelector];
    [invocation setTarget:self];
    return invocation;
}

- (id)st_invokeSelector:(NSInvocation *)invocation
{
    // 没有 methodSignature 返回 nil。
    if (!invocation) return nil;
    NSAssert(invocation.methodSignature, @"invoke 没有 methodSignature");
    if (!invocation.methodSignature) return nil;
    
    NSMethodSignature *methodSign = invocation.methodSignature;
    const char *type = methodSign.methodReturnType;
    
    if ((strstr(type, @encode(id)) != NULL) || (strstr(type, @encode(Class)) != 0)) {
        // Class 和 NSObject 子类 -performSelector:withObject: 返回值正常。
        return [self st_invokeObjectReturnValueSelector:invocation];
    } else if(strcmp(type, @encode(__typeof__(nil))) == 0) {
        [invocation invoke];
        return nil;
    } else if(strstr(type, @encode(void (^)(void))) != NULL) {
        // Blocks will be treated as vanilla objects, as of clang 4.1.
        return [self st_invokeObjectReturnValueSelector:invocation];
    } else if (strcmp(type, @encode(void)) == 0) {
        [invocation invoke];
        void *result = (__bridge void *)@0;
        return (__bridge id)(result);
    } else {
        return [self st_invokeScalarReturnValueSelector:invocation];
    }
    return nil;
}

// !!!: private method
- (id)st_invokeObjectReturnValueSelector:(NSInvocation *)invocation
{
    // 没有 methodSignature 返回 nil。
    if (!invocation) return nil;
    //    NSAssert(invocation.methodSignature, @"invoke 没有 methodSignature");
    if (!invocation.methodSignature) return nil;
    if (invocation.methodSignature.numberOfArguments <= 2) {
        // frame #3: 0x0000000105d43741 FrontBoardServices`-[FBSSerialQueue _performNext] + 178
        // frame #4: 0x0000000111d308f3 FrontBoardServices`-[FBSSerialQueue _performNextFromRunLoopSource] + 45
        // 导致 RunLoop 下行
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [invocation.target performSelector:invocation.selector];
#pragma clang diagnostic pop
    }
    [invocation invoke];
    @try {
        // struct value wraps in NSValue, maybe crashing on i386
        // Given a scalar or struct value, wraps it in NSValue.
        id result;
        [invocation getReturnValue:&result];
        return result;
    } @catch (NSException *exception) {
        // 其他类型 swift tuple、struct 等(包括 未知类型)
        STRouterLog(@"%@", exception);
    } @finally {
        
    }
}

- (STRouterValue *)st_invokeScalarReturnValueSelector:(NSInvocation *)invocation
{
    // 没有 methodSignature 返回 nil。
    if (!invocation) return nil;
    //    NSAssert(invocation.methodSignature, @"invoke 没有 methodSignature");
    if (!invocation.methodSignature) return nil;
    [invocation invoke];
    @try {
        // struct value wraps in NSValue, maybe crashing on i386
        // Given a scalar or struct value, wraps it in NSValue.
        if (strcmp(invocation.methodSignature.methodReturnType, @encode(CGRect)) == 0) {
            // CGRect 复杂结构体（结构体的成员是结构体，无法鸡贼的使用void *指针通过[NSValue value:&result withObjCType:invocation.methodSignature.methodReturnType] initialize NSValue obj）
            CGRect result;
            [invocation getReturnValue:&result];
            NSValue *value = [NSValue valueWithCGRect:result];
            return [[STRouterValue alloc] initWithValue:value valueLength:invocation.methodSignature.methodReturnLength];
        }
        void *result;
        [invocation getReturnValue:&result];
        NSValue *val = [NSValue value:&result withObjCType:invocation.methodSignature.methodReturnType];
        return [[STRouterValue alloc] initWithValue:val valueLength:invocation.methodSignature.methodReturnLength];
    } @catch (NSException *exception) {
        // 其他类型 swift tuple、struct 等(包括 未知类型)
        //        KSZCMediateRouterLog(@"%@", exception);
    } @finally {
        
    }
}
@end


@implementation NSObject (STVanilla)
- (void)configInvocation:(NSInvocation *)invocation params:(void *)params args:(va_list)args {
    NSMethodSignature *methodSign = invocation.methodSignature;
    if (params) {
        int i = 2;
        [invocation setArgument:params atIndex:i++];
        void *tmp;
        while ((tmp = va_arg(args, void *))) {
            if (i >= methodSign.numberOfArguments) break;
            [invocation setArgument:tmp atIndex:i++];
        }
    }
}
@end

