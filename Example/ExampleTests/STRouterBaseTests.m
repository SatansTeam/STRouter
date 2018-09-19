//
//  STRouterBaseTests.m
//  ExampleTests
//
//  Created by 王铎睿 on 2018/9/19.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "STRouterBaseTests.h"

bool KSZCClassEqualToClass(Class cls1, Class cls2)
{
    return [NSStringFromClass(cls1) isEqualToString:NSStringFromClass(cls2)];
}

@implementation STRouterBaseTests
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.tmpA = ModuleA.new;
    self.targetNameA = @"ModuleA";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.tmpA = nil;
    self.targetNameA = nil;
}
@end
