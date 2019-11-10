//
//  ViewController.m
//  SnapChatLogin
//
//  Created by tassel on 2019/11/10.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "ViewController.h"
@import SCSDKLoginKit;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setTitle:@"SnapChat登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(100, 300, 100, 50);
    [loginBtn addTarget:self action:@selector(snapChatLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)snapChatLogin {

    [SCSDKLoginClient loginFromViewController:self completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            [self fetchUserData];
        }
    }];
}
- (void)fetchUserData {
    
    //这里是GraphQL 获取需要的用户信息，可以根据需要获取
    NSString *queryString = @"{me{externalId, displayName, bitmoji{avatar}}}";
    [SCSDKLoginClient fetchUserDataWithQuery:queryString variables:nil success:^(NSDictionary * _Nullable resources) {
        NSLog(@"=========> user data %@",resources);
    } failure:^(NSError * _Nullable error, BOOL isUserLoggedOut) {
        
    }];
}
@end
