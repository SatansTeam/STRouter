//
//  NSObject+STPublication.m
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "NSObject+STPublication.h"
#import "NSObject+STPrivateness.h"

@implementation NSObject (STPublication)
- (id)st_performSelector:(SEL)aSelector arguments:(void *)arguments, ...
{
    if ([self respondsToSelector:aSelector]) {
        NSInvocation *invocation = [self st_getInvocationSelector:aSelector];
        // 处理action无参数，params传nil或NULL情况
        if (invocation.methodSignature.numberOfArguments <= 2) return [self st_invokeSelector:invocation];
        va_list args; // 定义一个指向个数可变的参数列表指针；
        va_start(args, arguments);
        [self configInvocation:invocation params:arguments args:args];
        va_end(args); // 清空参数列表，并置参数指针args无效。
        return [self st_invokeSelector:invocation];
    }
    return nil;
}
@end


@implementation NSObject (KSZCKVC)
- (void)optimizedCSetValue:(void *)value forKey:(NSString *)key
{
    if (!key) return;
    if (key.length == 0) return;
    NSString *prefix = [key substringToIndex:1].uppercaseString;
    NSString *subkey = [key substringFromIndex:1];
    NSString *selName = [NSString stringWithFormat:@"set%@%@:", prefix, subkey];
    SEL sel = NSSelectorFromString(selName);
    NSAssert([self respondsToSelector:sel], @"当前对象不能响应该方法");
    if (![self respondsToSelector:sel]) return;
    NSMethodSignature *ms = [self methodSignatureForSelector:sel];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:ms];
    [inv setTarget:self];
    [inv setSelector:sel];
    [inv setArgument:value atIndex:2];
    [inv invoke];
}


- (void)optimizedOCSetValue:(id)value forKey:(NSString *)key
{
    [self optimizedCSetValue:&value forKey:key];
}
@end

