//
//  UIImage+Peanut.h
//  PeanutApp
//
//  Created by juqiangxie on 2017/10/17.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Peanut)
+(UIImage*) createImageWithColor:(UIColor*) color;


#pragma mark X：横向第几个 Y：竖向第几个  X\Y从0开始  wideCount：横向小图标的个数  heightCount：纵向小图标的个数 count个数从1开始
+(UIImage *)cutBigImage:(UIImage *)bigImage wide_X:(CGFloat)X  heigh_Y:(CGFloat)Y wideCount:(CGFloat)wideCount heightCount:(CGFloat)heightCount;

- (UIImage *)barrageImageScaleToSize:(CGSize)size;

@end
