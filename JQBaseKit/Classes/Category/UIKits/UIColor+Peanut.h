//
//  UIColor+Peanut.h
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/8.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PN_COLOR(R, G, B, A) [UIColor pn_colorWithRed:R green:G blue:B alpha:A]

@interface UIColor (Peanut)

+ (UIColor *)pn_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;
+ (UIColor *)pn_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

+ (UIColor *)pn_colorWithHex:(long)hex;
+ (UIColor *)pn_colorWithHex:(long)hex alpha:(CGFloat)alpha;

+ (UIColor *)pn_colorWithHexString:(NSString *)hexString;
+ (UIColor *)pn_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

//根据铁路线路拿背景颜色
+ (UIColor *)pn_getColorInLineCode:(NSString *)lineCode;

//根据城市和铁路线路拿背景颜色
+ (UIColor *)pn_getColorCityName:(NSString *)cityName inLineCode:(NSString *)lineCode;

@end
