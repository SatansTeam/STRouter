//
//  ViewController.m
//  Example
//
//  Created by 王铎睿 on 2018/5/2.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "ViewController.h"
#import <STRouter/STRouter.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[STRouter router] performAction:@"voidReturnValueMethod" target:@"ModuleA" params:nil shouldCacheTarget:NO];
//    NSString *a = @"qwer";
//    NSString *b = @"asd";
//    id obj = [[STRouter router] st_performAction:@"qwer:aaa:" target:@"ModuleA" shouldCacheTarget:NO params:&a,&b];
//    STRouterBridgingRetain(@"ads");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
