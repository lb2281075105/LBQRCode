//
//  CIImage+Extension.h
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>

@interface CIImage (Extension)
- (UIImage *)createNonInterpolatedWithSize:(CGFloat)size;

@end
