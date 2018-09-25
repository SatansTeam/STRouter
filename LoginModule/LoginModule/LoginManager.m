//
//  LoginManager.m
//  LoginModule
//
//  Created by 王铎睿 on 2018/9/25.
//

#import "LoginManager.h"

@interface LoginManager ()
@property (nonatomic, assign) BOOL logined;
@end

@implementation LoginManager

+ (instancetype)manager
{
    static LoginManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = LoginManager.new;
    });
    return manager;
}

- (BOOL)isLogined
{
    return self.logined;
}

- (void)login:(NSString *)username password:(NSString *)password completion:(void (^)(BOOL seccussed))completion
{
    self.logined = YES;
    if (completion) completion(YES);
}
@end
