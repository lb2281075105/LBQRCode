//
//  LBCreateQRCodeController.m
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#import "LBCreateQRCodeController.h"
#import "CIImage+Extension.h"
#import "LBQRCodeHeader.h"
@interface LBCreateQRCodeController ()
@property (strong, nonatomic) UIImageView *codeImage;

@end

@implementation LBCreateQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"生成二维码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupRightItem];
    
    [self creatCodeImage];
}

- (void)setupRightItem{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(processSaveToPhoto)];
}
- (void)creatCodeImage{
    self.codeImage = [[UIImageView alloc]initWithFrame:CGRectMake(LBWidth / 2.0 - 100, LBHeight / 2.0 - 100, 200, 200)];
    [self.view addSubview:self.codeImage];
    /**
     *  2.生成CIFilter(滤镜)对象
     */
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    /**
     *  3.恢复滤镜默认设置
     */
    [filter setDefaults];
    
    /**
     *  4.设置数据(通过滤镜对象的KVC)
     */
    //存放的信息
    NSString *info = @"帅哥,你成功了";
    //把信息转化为NSData
    NSData *infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
    //滤镜对象kvc存值
    [filter setValue:infoData forKeyPath:@"inputMessage"];
    
    /**
     *  5.生成二维码
     */
    CIImage *outImage = [filter outputImage];
    
    //imageView.image = [UIImage imageWithCIImage:outImage];//不处理图片模糊,故而调用下面的信息
    
    self.codeImage.image = [outImage createNonInterpolatedWithSize:150];
    
}


// 保存二维码
- (void)processSaveToPhoto{
    
    //    UIImageWriteToSavedPhotosAlbum(self.codeImageView.image, self, @selector(saveImage:didFinishSavingWithError:contextInfo:), nil);
    [self makeScreenShotCompletion:^(UIImage *image) {
        
    }];
}

/**
 *  简单截屏并将图片保存到本地
 */
-(void)makeScreenShotCompletion:(void(^)(UIImage * image))completion{
    //开启上下文  <span style="font-family: Arial, Helvetica, sans-serif;">设置截屏大小</span>
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    completion(image);
    
    /**
     *  将图片保存到本地相册
     */
    UIImageWriteToSavedPhotosAlbum(image, self , @selector(saveImage:didFinishSavingWithError:contextInfo:), nil);//保存图片到照片库
    
}
- (void)saveImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == nil) {
        [self showAlertViewWithTitle:@"提示" withMessage:@"已经存入手机相册"];
    }
    else
    {
        [self showAlertViewWithTitle:@"提示" withMessage:@"保存失败"];
    }
}
#pragma mark ===========添加提示框===========
//提示框alert
- (void)showAlertViewWithTitle:(NSString *)aTitle withMessage:(NSString *)aMessage
{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:aTitle message:[NSString stringWithFormat:@"%@",aMessage] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:true completion:^{
        
    }];
    
}


@end
