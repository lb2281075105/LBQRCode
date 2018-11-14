# LBQRCode
微信二维码、扫描、生成二维码、保存二维码

#### 使用说明
直接导入`LBQRCode`文件夹到自己项目中,调用相应的`LBQRCodeScanController`和 `LBCreateQRCodeController`控制器就可以了



#### 扫描二维码

##### 1. 首先倒入框架
```
#import <AVFoundation/AVFoundation.h>
```
###### 2. 遵守协议

```
<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
```

###### 3. 主要用到的属性设置

```
// 捕获设备，默认后置摄像头
@property (strong, nonatomic) AVCaptureDevice * device;

// 输入设备
@property (strong, nonatomic) AVCaptureDeviceInput * input;

// 输出设备，需要指定他的输出类型及扫描范围
@property (strong, nonatomic) AVCaptureMetadataOutput * output;

// AVFoundation框架捕获类的中心枢纽，协调输入输出设备以获得数据
@property (strong, nonatomic) AVCaptureSession * session;

// 展示捕获图像的图层，是CALayer的子类
@property (strong, nonatomic) AVCaptureVideoPreviewLayer * preview;
```

##### 4.拉起本地相册二维码
```
- (void)chooseButtonClick{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        // 关闭扫描
        [self stopScan];

        //1. 弹出系统相册
        UIImagePickerController *pickVC = [[UIImagePickerController alloc]init];
        //2. 设置照片来源
        /**
        UIImagePickerControllerSourceTypePhotoLibrary,相册
        UIImagePickerControllerSourceTypeCamera,相机
        UIImagePickerControllerSourceTypeSavedPhotosAlbum,照片库
        */

        pickVC.sourceType =   UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        //3. 设置代理
        pickVC.delegate = self;
        //4.转场动画
        self.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:pickVC animated:YES completion:nil];
    }else{
        [self showAlertViewWithTitle:@"打开失败" withMessage:@"相册打开失败。设备不支持访问相册，请在设置->隐私->照片中进行设置！"];
    }

}

```

#### 生成二维码

##### 1.二维码的生成
```
/**
*  1.生成CIFilter(滤镜)对象
*/
CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

/**
*  2.恢复滤镜默认设置
*/
[filter setDefaults];

/**
*  3.设置数据(通过滤镜对象的KVC)
*/
// 存放的信息
NSString *info = @"hahahahhahahaha";
// 把信息转化为NSData
NSData *infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
// 滤镜对象kvc存值
[filter setValue:infoData forKeyPath:@"inputMessage"];

/**
*  4.生成二维码
*/
CIImage *outImage = [filter outputImage];

// imageView.image = [UIImage imageWithCIImage:outImage];//不处理图片模糊,故而调用下面的信息

self.codeImage.image = [outImage createNonInterpolatedWithSize:150];

```

#### 保存二维码

##### 1. 保存到本地相册
```
UIGraphicsBeginImageContext(self.view.bounds.size);

[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];

// 获取图片
UIImage * image = UIGraphicsGetImageFromCurrentImageContext();

// 关闭上下文
UIGraphicsEndImageContext();

completion(image);

/**
*  将图片保存到本地相册
*/
UIImageWriteToSavedPhotosAlbum(image, self , @selector(saveImage:didFinishSavingWithError:contextInfo:), nil);
```



