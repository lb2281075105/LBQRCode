//
//  LBQRCodeHeader.h
//  LBQRCode
//
//  Created by liubo on 2018/11/14.
//  Copyright © 2018年 JCSON. All rights reserved.
//

#define LBHeight [UIScreen mainScreen].bounds.size.height
#define LBWidth [UIScreen mainScreen].bounds.size.width
#define LBXCenter self.view.center.x
#define LBYCenter self.view.center.y

#define LBSHeight 20

#define LBSWidth (LBXCenter+30)
#define LBWeakSelf(type)  __weak typeof(type) weak##type = type;
