//
//  HUDManager.m
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/16.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import "HUDManager.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation HUDManager

+ (void)showHUDWaiting:(NSString *)tips inView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = tips;
}
+ (void)showHUDWaitingInWindow:(NSString *)tips{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.detailsLabel.text = tips;
    
}
+ (void)showHUD:(NSString *)tips inView:(UIView *)view afterDelay:(CGFloat)delay{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = tips;
    [hud hideAnimated:YES afterDelay:delay];
}
+ (void)showHUDInWindow:(NSString *)tips afterDelay:(CGFloat)delay{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.detailsLabel.text = tips;
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)hideHUDInView:(UIView *)view{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:YES];
    });
}

+ (void)hideHUDInWindow{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:window animated:YES];
    });
}

@end
