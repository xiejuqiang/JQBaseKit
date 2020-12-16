//
//  UIView+Peanut.h
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/8.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Peanut)<CAAnimationDelegate>
@property(nonatomic) CGFloat pn_top;
@property(nonatomic) CGFloat pn_left;
@property(nonatomic) CGFloat pn_bottom;
@property(nonatomic) CGFloat pn_right;
@property(nonatomic) CGFloat pn_centerX;
@property(nonatomic) CGFloat pn_centerY;
@property(nonatomic) CGFloat pn_width;
@property(nonatomic) CGFloat pn_height;
@property(nonatomic) CGPoint pn_origin;
@property(nonatomic) CGSize pn_size;
@property(nonatomic,readonly) CGFloat pn_screenX;
@property(nonatomic,readonly) CGFloat pn_screenY;
@property(nonatomic,readonly) CGFloat pn_screenViewX;
@property(nonatomic,readonly) CGFloat pn_screenViewY;
@property(nonatomic,readonly) CGRect pn_screenFrame;

/**
 *@brief 返回UIViewAutoResizeMask
 *@param top 是否固定顶端边距
 *@param left 是否固定左端边距
 *@param bottom 是否固定底端边距
 *@param right 是否固定右端边距
 *@param width 是否允许宽度变化
 *@param height 是否允许高度变化
 */
+ (NSInteger)pn_autoResizeMaskWithTop:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right width:(BOOL)width height:(BOOL)height;
//添加中线
- (void)pn_addMiddleLine:(UIColor *)lineColor;
//是否显示底部横线
- (void)pn_addBottomLine:(UIColor *)lineColor;
//是否显示顶部横线
- (void)pn_addTopLine:(UIColor *)lineColor;
//是否显示左部竖线
- (void)pn_addLeftLine:(UIColor *)lineColor;
//是否显示右部竖线
- (void)pn_addRightLine:(UIColor *)lineColor;
//添加中线
- (void)pn_addMiddleLine:(UIColor *)lineColor height:(CGFloat)height;
//是否显示底部横线
- (void)pn_addBottomLine:(UIColor *)lineColor height:(CGFloat)height;
//是否显示顶部横线
- (void)pn_addTopLine:(UIColor *)lineColor height:(CGFloat)height;
//是否显示左部竖线
- (void)pn_addLeftLine:(UIColor *)lineColor width:(CGFloat)width;
//是否显示右部竖线
- (void)pn_addRightLine:(UIColor *)lineColor width:(CGFloat)width;
//显示四周边框
- (void)pn_showBorder:(UIColor *)lineColor;
//显示四周边框
- (void)pn_showBorder:(UIColor *)lineColor width:(CGFloat)width;
//四周边框变圆
- (void)pn_circleWithCornerRadius:(CGFloat)radius;
//移除子视图
- (void)pn_removeAllSubviews;
- (void)pn_shadowWithOffset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity color:(CGColorRef)color;
//设置背景颜色
- (void)pn_setBackgroundColor:(UIColor *)color;

/*
 * @brief 从文件名称与类名称一样的nib文件加载视图
 */
+ (UIView *)pn_loadFromNib;

/*
 * @brief 从nib文件加载视图
 * @param nibName nib文件名称
 */
+ (UIView *)pn_loadFromNibName:(NSString *)nibName;

/*
 * @brief 获取图片
 */

- (UIImage *)pn_viewImage;

/*
 * @brief 添加Tap手势到View
 */
- (void)pn_addTapWithTarget:(id)target action:(SEL)action;

/*
 * @brief 抛物线动画
 */
-(void)pn_parabolaToPoint:(CGPoint)point;
-(void)pn_parabolaToPoint:(CGPoint)point scaleTo:(CGFloat)scale;
-(void)pn_parabolaToPoint:(CGPoint)point duration:(CGFloat)duration;
-(void)pn_parabolaToPoint:(CGPoint)point scaleTo:(CGFloat)scale duration:(CGFloat)duration;
@end
