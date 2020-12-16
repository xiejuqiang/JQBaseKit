//
//  NSMutableArray+Peanut.m
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/13.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "NSMutableArray+Peanut.h"

@implementation NSMutableArray (Peanut)

- (void)pn_addObject:(id)anObject{
    if (anObject) [self addObject:anObject];
}

- (void)pn_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject && index <= self.count) [self insertObject:anObject atIndex:index];
}

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
