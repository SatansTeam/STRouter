//
//  LoginManager.h
//  LoginModule
//
//  Created by 王铎睿 on 2018/9/25.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject
+ (instancetype)manager;
- (BOOL)isLogined;
- (void)login:(NSString *)username password:(NSString *)password completion:(void (^)(BOOL seccussed))completion;
@end
