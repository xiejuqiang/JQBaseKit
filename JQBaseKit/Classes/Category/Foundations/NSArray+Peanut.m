//
//  NSArray+Peanut.m
//  PeanutApp
//
//  Created by suntie on 2017/6/12.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "NSArray+Peanut.h"

@implementation NSArray (Peanut)

- (id)pn_objectAtIndex:(NSInteger)index{
    if (index < self.count && index >= 0){
        return [self objectAtIndex:index];
    }else{
        NSString * info = [NSString stringWithFormat:@"%s 下标%zd数组count%zd越界了",__FUNCTION__,index,self.count];
        NSLog(@"%@", info);
        return nil;
    }
}




@end
