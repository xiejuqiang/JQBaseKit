//
//  UIImage+Peanut.m
//  PeanutApp
//
//  Created by juqiangxie on 2017/10/17.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "UIImage+Peanut.h"

@implementation UIImage (Peanut)
+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



+(UIImage *)cutBigImage:(UIImage *)bigImage wide_X:(CGFloat)X  heigh_Y:(CGFloat)Y wideCount:(CGFloat)wideCount heightCount:(CGFloat)heightCount
{
    
    if (X > wideCount-1 || Y > heightCount-1) {
        NSLog(@"sorry,在bigImage中越界了！！！");
        return nil;
    }
    // 从大图片裁剪对应的小图片
    // 伸缩属性
//    NSLog(@"伸缩了%f倍", [UIScreen mainScreen].scale) ;
    
    //    CGFloat smallW = bigImage.size.width / 3 * [UIScreen mainScreen].scale;
    //    CGFloat smallH = bigImage.size.height / 8 * [UIScreen mainScreen].scale;
    
    CGFloat smallW = bigImage.size.width / wideCount ;
    CGFloat smallH = bigImage.size.height / heightCount ;
    
    CGRect smallRect = CGRectMake(smallW * X, smallH * Y, smallW, smallH);
    
    // CGImageCreateWithImageInRect  该方法只认像素  uikit里是点像素
    CGImageRef smallImageRef = CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);
    
    UIImage* smallImage = [UIImage imageWithCGImage: smallImageRef];
    
    CGImageRelease(smallImageRef);
    return smallImage;
}

- (UIImage *)barrageImageScaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
