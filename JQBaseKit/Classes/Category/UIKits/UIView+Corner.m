//
//  UIView+Corner.m
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/16.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "UIView+Corner.h"
#import "UIColor+Peanut.h"

@implementation UIView (Corner)
- (void)cornerWithRadius:(CGFloat)radius
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)cornerShadow {
    self.layer.shadowOpacity = 0.15;// 阴影透明度
    self.layer.shadowColor = [UIColor pn_colorWithHexString:@"#333333"].CGColor;// 阴影的颜色
    self.layer.shadowRadius = 6;// 阴影扩散的范围控制
    self.layer.shadowOffset  = CGSizeMake(0, 3);// 阴影的范围
}

- (void)cornerShadowWithColor:(UIColor *)color shadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowOpacity = 0.15f;// 阴影透明度
    self.layer.shadowColor = color.CGColor;// 阴影的颜色
    self.layer.shadowRadius = shadowRadius;// 阴影扩散的范围控制
    self.layer.shadowOffset  = CGSizeMake(0, 2);// 阴影的范围
}


- (void)gradientLayerFrame:(CGRect)frame colors:(NSArray *)colors{
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.5),@(1.0)];//渐变点
    [gradientLayer setColors:colors];//渐变数组
    [self.layer addSublayer:gradientLayer];
}

@end
