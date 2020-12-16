//
//  UIView+Animation.m
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/18.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "UIView+Animation.h"
#import <QuartzCore/QuartzCore.h>

/*
 属性	说明
 duration	动画的时长
 repeatCount	重复的次数。不停重复设置为 HUGE_VALF
 repeatDuration	设置动画的时间。在该时间内动画一直执行，不计次数。
 beginTime	指定动画开始的时间。从开始延迟几秒的话，设置为【CACurrentMediaTime() + 秒数】 的方式
 timingFunction	设置动画的速度变化
 autoreverses	动画结束时是否执行逆动画
 fromValue	所改变属性的起始值
 toValue	所改变属性的结束时的值
 byValue	所改变属性相同起始值的改变量
 */

#define kRotationAnimationDefaultKey @"RotationAnimationDefaultKey"
#define kRotationAnimationDefaultDuration 0.5 //1.0
#define kBounceAnimationDefaultDuration 0.25

@implementation UIView (Animation)
#pragma mark - start rotation animation
/*start rotation animation with default key and default direction Clockwise*/
- (void)pn_startRotationAnimation{
    [self pn_startRotationAnimationWithDuration:kRotationAnimationDefaultDuration];
}

/*start rotation animation with default key and duration*/
- (void)pn_startRotationAnimationWithDuration:(NSTimeInterval)duration {
    [self pn_startRotationAnimationWithKey:kRotationAnimationDefaultKey duration:duration];
}

/*start rotation animation with default key and direction and default duration*/
- (void)pn_startRotationAnimationWithDirection:(RotationAnimationDirection)direction{
    [self pn_startRotationAnimationWithKey:kRotationAnimationDefaultKey direction:direction];
}

/*start rotation animation with key and default direction Clockwise*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key{
    [self pn_startRotationAnimationWithKey:key duration:kRotationAnimationDefaultDuration];
}

/*start rotation animation with key and and default direction Clockwise and duration*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key duration:(NSTimeInterval)duration {
    [self pn_startRotationAnimationWithKey:key direction:RotationAnimationDirectionClockwise duration:duration];
}

/*stop rotation animation with key and direction*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key direction:(RotationAnimationDirection)direction{
    [self pn_startRotationAnimationWithKey:key direction:direction duration:kRotationAnimationDefaultDuration];
}

/*start rotation animation with key and direction and duration*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key direction:(RotationAnimationDirection)direction duration:(NSTimeInterval)duration{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = (direction == RotationAnimationDirectionClockwise) ? @(0) : @(2*M_PI);
    animation.toValue = (direction == RotationAnimationDirectionClockwise) ? @(2*M_PI) : @(0);
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.fillMode =kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:key];
}
#pragma mark - stop rotation animation
/*stop rotation animation with default key*/
- (void)pn_stopRotationAnimation{
    [self pn_stopRotationAnimationWithKey:kRotationAnimationDefaultKey];
}

/*stop rotation animation with key*/
- (void)pn_stopRotationAnimationWithKey:(NSString *)key{
    [self pn_stopAnimationWithKey:key];
}

/*remove animation with key*/
- (void)pn_stopAnimationWithKey:(NSString *)key {
    [self.layer removeAnimationForKey:key];
}

#pragma mark - start bounce animation
/*start bounce animation with fromScale and toScale and default duration*/
- (void)pn_startBounceAnimationFromScale:(CGFloat)fromScale toScale:(CGFloat)toScale{
    [self pn_startBounceAnimationFromScale:fromScale toScale:toScale duration:kBounceAnimationDefaultDuration];
}

/*start bounce animation with fromScale and toScale and duration*/
- (void)pn_startBounceAnimationFromScale:(CGFloat)fromScale toScale:(CGFloat)toScale duration:(NSTimeInterval)duration{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(fromScale);
    animation.toValue = @(toScale);
    animation.duration = duration;
    animation.repeatCount = 1;
    animation.removedOnCompletion = YES;
    animation.fillMode =kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:nil];
}

@end
