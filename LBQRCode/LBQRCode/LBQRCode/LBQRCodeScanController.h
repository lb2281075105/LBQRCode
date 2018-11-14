//
//  LBQRCodeScanController.h
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBQRCodeHeader.h"
#import <AVFoundation/AVFoundation.h>

@interface LBQRCodeScanController : UIViewController<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
// 捕获设备，默认后置摄像头
@property (strong, nonatomic) AVCaptureDevice * device;
// 输入设备
@property (strong, nonatomic) AVCaptureDeviceInput * input;
// 输出设备，需要指定他的输出类型及扫描范围
@property (strong, nonatomic) AVCaptureMetadataOutput * output;
// AVFoundation框架捕获类的中心枢纽，协调输入输出设备以获得数据
@property (strong, nonatomic) AVCaptureSession * session;
//展示捕获图像的图层，是CALayer的子类
@property (strong, nonatomic) AVCaptureVideoPreviewLayer * preview;
// 缩放手势
@property (strong, nonatomic) UIPinchGestureRecognizer *pinchGes;
// 扫描框
@property (nonatomic,strong)UIImageView *imageView;

// 扫描线
@property (nonatomic,retain)UIImageView *line;

@end
