//
//  HUDManager.h
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/16.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUDManager : NSObject
+ (void)showHUDWaiting:(NSString *)tips inView:(UIView *)view;
+ (void)showHUDWaitingInWindow:(NSString *)tips;
+ (void)showHUD:(NSString *)tips inView:(UIView *)view afterDelay:(CGFloat)delay;
+ (void)showHUDInWindow:(NSString *)tips afterDelay:(CGFloat)delay;
+ (void)hideHUDInView:(UIView *)view;
+ (void)hideHUDInWindow;
@end

NS_ASSUME_NONNULL_END
