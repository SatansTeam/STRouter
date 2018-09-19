//
//  NSObject+STPrivateness.h
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (STPrivateness)
- (NSInvocation *)st_getInvocationSelector:(SEL)aSelector;
- (id)st_invokeSelector:(NSInvocation *)invocation;
@end

@interface NSObject (STVanilla)
- (void)configInvocation:(NSInvocation *)invocation params:(void *)params args:(va_list)args;
@end

