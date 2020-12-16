//
//  UIView+Corner.h
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/16.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Corner)
- (void)cornerWithRadius:(CGFloat)radius;
- (void)cornerShadow;
- (void)cornerShadowWithColor:(UIColor *)color shadowRadius:(CGFloat)shadowRadius;
/**
 添加渐变色

 @param frame 大小
 @param colors 颜色数组CGColor类型
 */
- (void)gradientLayerFrame:(CGRect)frame colors:(NSArray *)colors;
@end
