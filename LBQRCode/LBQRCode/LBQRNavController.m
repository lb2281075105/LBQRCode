//
//  LBQRNavController.m
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#import "LBQRNavController.h"

@interface LBQRNavController ()<UINavigationControllerDelegate>

@end

@implementation LBQRNavController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        /// 返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftback"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftPopClick)];
        viewController.hidesBottomBarWhenPushed = true;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)leftPopClick{
    [self popViewControllerAnimated:YES];
}

@end
