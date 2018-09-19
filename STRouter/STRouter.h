//
//  STRouter.h
//  STRouter
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STRouterValue.h"
#import "NSObject+STPublication.h"

extern void * STRouterBridgingRetain(id X);

@interface STRouter : NSObject
+ (instancetype)router;
// 根据类名清理 cached target，释放内存
- (void)removeCachedTarget:(NSString *)targetName;
@end


@interface STRouter (Vanilla)
// !!!: obj
- (id)st_performAction:(NSString *)actionName target:(NSString *)targetName;
- (id)st_performAction:(NSString *)actionName target:(NSString *)targetName shouldCacheTarget:(BOOL)shouldCacheTarget  params:(void *)params, ... ;

// !!!: class
- (id)st_performClassAction:(NSString *)actionName target:(NSString *)targetName;
- (id)st_performClassAction:(NSString *)actionName target:(NSString *)targetName params:(void *)params, ... ;
@end
