//
//  STRouterBaseTests.h
//  ExampleTests
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <STRouter/STRouter.h>
#import "ModuleA.h"

FOUNDATION_EXTERN bool KSZCClassEqualToClass(Class cls1, Class cls2);

@interface STRouterBaseTests : XCTestCase
@property (nonatomic, strong) ModuleA *tmpA;
@property (nonatomic, copy) NSString *targetNameA;
@end
