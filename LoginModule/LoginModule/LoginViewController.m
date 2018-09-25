//
//  LoginViewController.m
//  LoginModule
//
//  Created by 王铎睿 on 2018/9/25.
//

#import "LoginViewController.h"
#import "LoginManager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat edge = 66.f;
    
    UITextField *username = UITextField.new;
    username.frame = CGRectMake(edge, 100.f, CGRectGetWidth([UIScreen mainScreen].bounds) - edge * 2, 60.f);
    username.placeholder = @"请输入昵称";
    [self.view addSubview:username];
    
    UITextField *password = UITextField.new;
    password.frame = CGRectMake(edge, 200.f, CGRectGetWidth([UIScreen mainScreen].bounds) - edge * 2, 60.f);
    password.placeholder = @"请输入密码";
    [self.view addSubview:password];
    
    UIButton *loginBtn = UIButton.new;
    loginBtn.frame = CGRectMake(edge, 300.f, CGRectGetWidth([UIScreen mainScreen].bounds) - edge * 2, 60.f);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:UIColor.cyanColor forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)loginAction
{
    [[LoginManager manager] login:@"111" password:@"222" completion:^(BOOL seccussed) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:seccussed ? @"登录成功" : @"登录失败" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [al show];
    }];
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
