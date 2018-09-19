//
//  NSObject+STPublication.h
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (STPublication)
- (id)st_performSelector:(SEL)aSelector arguments:(void *)arguments, ...;
@end


@interface NSObject (STKVC)
- (void)optimizedCSetValue:(void *)value forKey:(NSString *)key;
- (void)optimizedOCSetValue:(id)value forKey:(NSString *)key;
@end
