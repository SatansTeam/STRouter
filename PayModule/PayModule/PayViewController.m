//
//  PayViewController.m
//  PayModule
//
//  Created by 王铎睿 on 2018/9/25.
//

#import "PayViewController.h"
#import <STRouter/STRouter.h>
@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"支付页";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat edge = 66.f;
    
    UILabel *priceLab = UILabel.new;
    priceLab.frame = CGRectMake(edge, 200.f, CGRectGetWidth([UIScreen mainScreen].bounds) - edge * 2, 60.f);
    priceLab.text = @"请支付200￥";
    [self.view addSubview:priceLab];
    
    UIButton *payBtn = UIButton.new;
    payBtn.frame = CGRectMake(edge, 360.f, CGRectGetWidth([UIScreen mainScreen].bounds) - edge * 2, 60.f);
    [payBtn setTitle:@"支付" forState:UIControlStateNormal];
    [payBtn setTitleColor:UIColor.cyanColor forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
}


- (void)payAction
{
    NSObject *loginManager = [[STRouter router] st_performClassAction:@"manager" target:@"LoginManager"];
    STRouterValue *res = [loginManager st_performSelector:NSSelectorFromString(@"isLogined") arguments:nil];
    if (!res.boolValue) {
        UIViewController *loginVC = [[STRouter router] st_performClassAction:@"new" target:@"LoginViewController"];
        [self.navigationController pushViewController:loginVC animated:YES];
    } else {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"支付成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [al show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
