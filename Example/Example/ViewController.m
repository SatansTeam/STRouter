//
//  ViewController.m
//  Example
//
//  Created by 王铎睿 on 2018/5/2.
//  Copyright © 2018年 王铎睿. All rights reserved.
//

#import "ViewController.h"
#import <PayModule/PayModule.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat edge = 66.f;
    
    UIButton *payBtn = UIButton.new;
    payBtn.frame = CGRectMake(edge, 200.f, CGRectGetWidth([UIScreen mainScreen].bounds) - edge * 2, 60.f);
    [payBtn setTitle:@"支付" forState:UIControlStateNormal];
    [payBtn setTitleColor:UIColor.cyanColor forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
}

- (void)payAction
{
    PayViewController *pvc = PayViewController.new;
    [self.navigationController pushViewController:pvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
