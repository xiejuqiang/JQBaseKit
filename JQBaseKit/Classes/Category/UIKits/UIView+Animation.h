//
//  UIView+Animation.h
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/18.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    RotationAnimationDirectionClockwise,/*顺时针*/
    RotationAnimationDirectionAnticlockwise/*逆时针*/
}RotationAnimationDirection;

@interface UIView (Animation)
#pragma mark - start rotation animation
/*start rotation animation with default key and default direction Clockwise*/
- (void)pn_startRotationAnimation;
/*start rotation animation with default key and default direction Clockwise and duration*/
- (void)pn_startRotationAnimationWithDuration:(NSTimeInterval)duration;
/*start rotation animation with default key and direction and default duration*/
- (void)pn_startRotationAnimationWithDirection:(RotationAnimationDirection)direction;
/*start rotation animation with key and default direction Clockwise*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key;
/*start rotation animation with key and default direction Clockwise and duration*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key duration:(NSTimeInterval)duration;
/*start rotation animation with key and direction and default duration*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key direction:(RotationAnimationDirection)direction;
/*start rotation animation with key and direction and duration*/
- (void)pn_startRotationAnimationWithKey:(NSString *)key direction:(RotationAnimationDirection)direction duration:(NSTimeInterval)duration;
#pragma mark - stop rotation animation
/*stop rotation animation with default key*/
- (void)pn_stopRotationAnimation;
/*stop rotation animation with key*/
- (void)pn_stopRotationAnimationWithKey:(NSString *)key;
#pragma mark - start bounce animation
/*start bounce animation with fromScale and toScale and default duration*/
- (void)pn_startBounceAnimationFromScale:(CGFloat)fromScale toScale:(CGFloat)toScale;
/*start bounce animation with fromScale and toScale and duration*/
- (void)pn_startBounceAnimationFromScale:(CGFloat)fromScale toScale:(CGFloat)toScale duration:(NSTimeInterval)duration;
@end
