//
//  UILabel+Peanut.h
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/18.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Peanut)
/*
 * @brief 解决UILabel 文字模糊
 */
- (void)solveFuzz;

/*
 * @brief 创建label
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font color:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)labelWithFont:(UIFont *)font color:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;

+ (CGSize)boundingRectWithWidth:(CGFloat)maxWidth withTextFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing text:(NSString *)text;

+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label;

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

@end
