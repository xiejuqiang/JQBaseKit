//
//  UIView+Peanut.m
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/8.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "UIView+Peanut.h"

@implementation UIView (Peanut)

//上边坐标
- (CGFloat)pn_top
{
    return self.frame.origin.y;
}
- (void)setPn_top:(CGFloat)aTop
{
    CGRect frame = self.frame;
    frame.origin.y = aTop;
    self.frame = frame;
}

//左边坐标
- (CGFloat)pn_left
{
    return self.frame.origin.x;
}
- (void)setPn_left:(CGFloat)aLeft
{
    CGRect frame = self.frame;
    frame.origin.x = aLeft;
    self.frame = frame;
}

//下边坐标
- (CGFloat)pn_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setPn_bottom:(CGFloat)aBottom
{
    CGRect frame = self.frame;
    frame.origin.y = aBottom - self.frame.size.height;
    self.frame = frame;
}

//右边坐标
- (CGFloat)pn_right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setPn_right:(CGFloat)aRight
{
    CGRect frame = self.frame;
    frame.origin.x = aRight - self.frame.size.width;
    self.frame = frame;
}

//中心位置
- (CGFloat)pn_centerX
{
    return self.center.x;
}
- (void)setPn_centerX:(CGFloat)aCenterX
{
    CGPoint center = self.center;
    center.x = aCenterX;
    self.center = center;
}

- (CGFloat)pn_centerY
{
    return self.center.y;
}
- (void)setPn_centerY:(CGFloat)aCenterY
{
    CGPoint center = self.center;
    center.y = aCenterY;
    self.center = center;
}

//宽度
- (CGFloat)pn_width
{
    return self.frame.size.width;
}
- (void)setPn_width:(CGFloat)aWidth
{
    CGRect frame = self.frame;
    frame.size.width = aWidth;
    self.frame = frame;
}

//高度
- (CGFloat)pn_height
{
    return self.frame.size.height;
}
- (void)setPn_height:(CGFloat)aHeight
{
    CGRect frame = self.frame;
    frame.size.height = aHeight;
    self.frame = frame;
}

//Origin
- (CGPoint)pn_origin
{
    return self.frame.origin;
}
- (void)setPn_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

//Size
- (CGSize)pn_size
{
    return self.frame.size;
}
- (void)setPn_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)pn_screenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.pn_left;
    }
    return x;
}

- (CGFloat)pn_screenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.pn_top;
    }
    return y;
}

- (CGFloat)pn_screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.pn_left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)pn_screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.pn_top;
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)pn_screenFrame
{
    return CGRectMake(self.pn_screenViewX, self.pn_screenViewY, self.pn_width, self.pn_height);
}

/**
 *@brief 返回UIViewAutoResizeMask
 *@param top 是否固定顶端边距
 *@param left 是否固定左端边距
 *@param bottom 是否固定底端边距
 *@param right 是否固定右端边距
 *@param width 是否允许宽度变化
 *@param height 是否允许高度变化
 */
+ (NSInteger)pn_autoResizeMaskWithTop:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right width:(BOOL)width height:(BOOL)height
{
    NSInteger mask = 0;
    if (top) {
        mask |= UIViewAutoresizingFlexibleBottomMargin;
    }
    if (left) {
        mask |= UIViewAutoresizingFlexibleRightMargin;
    }
    if (bottom) {
        mask |= UIViewAutoresizingFlexibleTopMargin;
    }
    if (right) {
        mask |= UIViewAutoresizingFlexibleLeftMargin;
    }
    if (width) {
        mask |= UIViewAutoresizingFlexibleWidth;
    }
    if (height) {
        mask |= UIViewAutoresizingFlexibleHeight;
    }
    return mask;
}

//显示底部横线
- (void)pn_addBottomLine:(UIColor *)lineColor
{
    [self pn_addBottomLine:lineColor height:0.5f];
}

- (void)pn_addMiddleLine:(UIColor *)lineColor height:(CGFloat)height
{
    UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(0, self.pn_height * 0.5, self.pn_width, height)];
    _line.backgroundColor = lineColor;
    [self addSubview:_line];
}

//添加中线
- (void)pn_addMiddleLine:(UIColor *)lineColor
{
    [self pn_addMiddleLine:lineColor height:0.5];
}

//是否显示顶部横线
- (void)pn_addTopLine:(UIColor *)lineColor
{
    [self pn_addTopLine:lineColor height:0.5f];
}

//是否显示左部竖线
- (void)pn_addLeftLine:(UIColor *)lineColor
{
    [self pn_addLeftLine:lineColor width:0.5f];
}

//是否显示右部竖线
- (void)pn_addRightLine:(UIColor *)lineColor
{
    [self pn_addRightLine:lineColor width:0.5f];
}
//是否显示底部横线
- (void)pn_addBottomLine:(UIColor *)lineColor height:(CGFloat)height
{
    UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(0, self.pn_height - height, self.pn_width, height)];
    _line.backgroundColor = lineColor;
    _line.autoresizingMask = [UIView pn_autoResizeMaskWithTop:NO left:YES bottom:YES right:YES width:YES height:NO];
    [self addSubview:_line];
}
//是否显示顶部横线
- (void)pn_addTopLine:(UIColor *)lineColor height:(CGFloat)height
{
    UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.pn_width, height)];
    _line.autoresizingMask = [UIView pn_autoResizeMaskWithTop:NO left:YES bottom:NO right:YES width:YES height:NO];
    _line.backgroundColor = lineColor;
    [self addSubview:_line];
}
//是否显示左部竖线
- (void)pn_addLeftLine:(UIColor *)lineColor width:(CGFloat)width
{
    UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.pn_height)];
    _line.backgroundColor = lineColor;
    _line.autoresizingMask = [UIView pn_autoResizeMaskWithTop:YES left:YES bottom:YES right:NO width:NO height:YES];
    [self addSubview:_line];
}
//是否显示右部竖线
- (void)pn_addRightLine:(UIColor *)lineColor width:(CGFloat)width
{
    UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(self.pn_width - width, 0, width, self.pn_height)];
    _line.backgroundColor = lineColor;
    _line.autoresizingMask = [UIView pn_autoResizeMaskWithTop:YES left:NO bottom:YES right:YES width:NO height:YES];
    [self addSubview:_line];
}

//是否显示四周边框
- (void)pn_showBorder:(UIColor *)lineColor
{
    [self pn_showBorder:lineColor width:0.5f];
}

//显示四周边框
- (void)pn_showBorder:(UIColor *)lineColor width:(CGFloat)width
{
    self.layer.borderWidth = width;
    self.layer.borderColor = lineColor.CGColor;
}

//四周边框变圆
- (void)pn_circleWithCornerRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

//移除子视图
- (void)pn_removeAllSubviews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

/**
 *@brief 设置阴影
 */
- (void)pn_shadowWithOffset:(CGSize)offset radius:(CGFloat)radius opacity:(CGFloat)opacity color:(CGColorRef)color
{
    [[self layer] setShadowOffset:offset];
    [[self layer] setShadowRadius:radius];
    [[self layer] setShadowOpacity:opacity];
    [[self layer] setShadowColor:color];
}

//设置背景颜色
- (void)pn_setBackgroundColor:(UIColor *)color
{
    self.backgroundColor = color;
    for (UIView *view in self.subviews) {
        [view pn_setBackgroundColor:color];
    }
}

/*
 * @brief 从文件名称与类名称一样的nib文件加载视图
 */
+ (UIView *)pn_loadFromNib
{
    NSString *nibName = [self description];
    return [self pn_loadFromNibName:nibName];
}

/*
 * @brief 从nib文件加载视图
 * @param nibName nib文件名称
 */
+ (UIView *)pn_loadFromNibName:(NSString *)nibName
{
    Class klass = [self class];
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for (id object in objects) {
        if ([object isKindOfClass:klass]) {
            return object;
        }
    }
    return nil;
}

- (UIImage *)pn_viewImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/*
 * @brief 添加Tap手势到View
 */
- (void)pn_addTapWithTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}


/*
 * @brief 抛物线动画
 */
-(void)pn_parabolaToPoint:(CGPoint)point
{
    [self pn_parabolaToPoint:point duration:0.5];
}

-(void)pn_parabolaToPoint:(CGPoint)point scaleTo:(CGFloat)scale
{
    [self pn_parabolaToPoint:point scaleTo:scale duration:0.5];
}

-(void)pn_parabolaToPoint:(CGPoint)point duration:(CGFloat)duration
{
    [self pn_parabolaToPoint:point scaleTo:1.0 duration:duration];
}

-(void)pn_parabolaToPoint:(CGPoint)point scaleTo:(CGFloat)scale duration:(CGFloat)duration
{
    [self.layer addAnimation:[self pathAnimationQuadCurveToPoint:point scaleTo:scale duration:duration] forKey:@"parabola"];
    self.transform =CGAffineTransformMakeScale(scale, scale);
    self.center = point;
}

- (CAAnimation*)pathAnimationQuadCurveToPoint:(CGPoint )pt scaleTo:(float)sc duration:(CGFloat)duration;
{
    CGPoint orignal =  self.center;
    CGPoint focus = CGPointZero;
    CGPoint symPoint = CGPointZero;
    CGPoint destPoint = pt;
    focus.x = orignal.x + (destPoint.x - orignal.x)/2;
    focus.y = orignal.y - (destPoint.y - orignal.y)/2;
    
    symPoint.x = 2* focus.x - orignal.x;
    symPoint.y = orignal.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,orignal.x,orignal.y);
    CGPathAddQuadCurveToPoint(path,NULL,focus.x ,focus.y,destPoint.x,destPoint.y);
    CAKeyframeAnimation *
    animation = [CAKeyframeAnimation
                 animationWithKeyPath:@"position"];
    [animation setPath:path];
    [animation setDuration:duration];
    //    [animation setKeyTimes:@[@0,@1,@3]];
    CFRelease(path);
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0;
    scaleAnimation.toValue = [NSNumber numberWithFloat:sc];
    scaleAnimation.duration = duration;
    
    CAAnimationGroup * animationGp = [CAAnimationGroup animation];
    animationGp.duration = duration;
    animationGp.animations = @[animation,scaleAnimation];
    animationGp.delegate = self;
    animationGp.removedOnCompletion = NO;
    return animationGp;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        if (anim == [self.layer animationForKey:@"parabola"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"parabola.did.stop" object:nil userInfo:@{@"tag":@(self.tag)}];
        }
        [self.layer removeAnimationForKey:@"parabola"];
        [self removeFromSuperview];
    }
}
@end
