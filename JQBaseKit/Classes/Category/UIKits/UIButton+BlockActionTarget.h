//
//  UIButton+BlockActionTarget.h
//  HandWealth
//
//  Created by xjq on 28/12/2016.
//  Copyright © 2016 medp. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(void);
@interface UIButton (BlockActionTarget)
-(void)handleClickEvent:(UIControlEvents)aEvent withClickBlick:(ActionBlock)buttonClickEvent;

@property (strong ,nonatomic) NSString *paramStr; // STCreate 为按钮添加字符串属性 用于按钮事件传值 若需要字典，数组等可以再添

@end
