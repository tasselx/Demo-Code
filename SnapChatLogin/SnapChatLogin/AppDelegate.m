//
//  AppDelegate.m
//  SnapChatLogin
//
//  Created by tassel on 2019/11/10.
//  Copyright © 2019 tassel. All rights reserved.
//

#import "AppDelegate.h"
@import SCSDKLoginKit;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    return [SCSDKLoginClient application:app openURL:url options:options];
}


@end
