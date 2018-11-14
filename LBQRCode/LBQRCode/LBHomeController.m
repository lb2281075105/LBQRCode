//
//  LBHomeController.m
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#import "LBHomeController.h"
#import <Masonry.h>
#import "LBQRCodeScanController.h"
#import "LBCreateQRCodeController.h"
@interface LBHomeController ()

@end

@implementation LBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"二维码、条形码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = @[];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupLayout];
}

- (void)setupLayout{
    
    // ======================  扫描二维码/条形码  ==============
    
    UIButton *saoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:saoBtn];
    [saoBtn setTitle:@"扫描二维码/条形码" forState:UIControlStateNormal];
    [saoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [saoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@40);
        make.centerX.equalTo(self.view);
    }];
    [saoBtn addTarget:self action:@selector(saoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // ======================  生成二维码  ==============

    UIButton *qrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:qrBtn];
    [qrBtn setTitle:@"生成二维码" forState:UIControlStateNormal];
    [qrBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [qrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(saoBtn.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
    }];
    [qrBtn addTarget:self action:@selector(qrBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}
#pragma 扫描二维码/条形码
- (void)saoBtnClick{
    [self.navigationController pushViewController:[[LBQRCodeScanController alloc]init] animated:YES];
}
#pragma 生成二维码
- (void)qrBtnClick{
    
    [self.navigationController pushViewController:[[LBCreateQRCodeController alloc]init] animated:YES];

}

@end
