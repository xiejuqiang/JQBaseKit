//
//  UIButton+BlockActionTarget.m
//  HandWealth
//
//  Created by xjq on 28/12/2016.
//  Copyright © 2016 medp. All rights reserved.
//

#import "UIButton+BlockActionTarget.h"
#import <objc/runtime.h>
static char *overViewKey;
@implementation UIButton (BlockActionTarget)
-(void)handleClickEvent:(UIControlEvents)aEvent withClickBlick:(ActionBlock)buttonClickEvent
{
    objc_setAssociatedObject(self, &overViewKey, buttonClickEvent, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonClick) forControlEvents:aEvent];
}
-(void)buttonClick
{
    ActionBlock blockClick = objc_getAssociatedObject(self, &overViewKey);
    if (blockClick != nil)
    {
        blockClick();
    }
}

- (NSString *)paramStr{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setParamStr:(NSString *)paramStr{
    objc_setAssociatedObject(self, @selector(paramStr), paramStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
