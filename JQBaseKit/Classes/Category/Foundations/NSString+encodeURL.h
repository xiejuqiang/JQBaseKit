//
//  NSString+encodeURL.h
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/13.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (encodeURL)
+ (NSString *)encodeURL:(NSString *)urlString;
+ (NSString *)allEncodeUrl:(NSString *)urlString;
+ (NSString *)decodeURL:(NSString *)urlString;
@end
