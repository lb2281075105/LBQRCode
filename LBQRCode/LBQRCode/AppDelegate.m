//
//  AppDelegate.m
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#import "AppDelegate.h"
#import "LBHomeController.h"
#import "LBQRNavController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    LBHomeController *home = [[LBHomeController alloc]init];
    
    LBQRNavController *nav = [[LBQRNavController alloc]initWithRootViewController:home];
    self.window.rootViewController = nav;

    [self.window makeKeyAndVisible];

    return YES;
}

@end
