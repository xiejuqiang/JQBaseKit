//
//  NSMutableArray+Peanut.h
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/13.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Peanut)
- (void)pn_addObject:(id)anObject;
- (void)pn_insertObject:(id)anObject atIndex:(NSUInteger)index;

- (id)pn_objectAtIndex:(NSInteger)index;

@end
