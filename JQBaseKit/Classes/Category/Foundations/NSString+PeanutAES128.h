//
//  NSString+PeanutAES128.h
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/12.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PeanutAES128)
/**
 *  加密
 */
+(NSString *)pn_aes128_encrypt:(NSString *)plainText key:(NSString *)key;
/**
 *  解密
 */
+(NSString *)pn_aes128_decrypt:(NSString *)encryptText key:(NSString *)key;
@end
