//
//  NSData+PeanutAES128.h
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/12.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (PeanutAES128)
-(NSData *)pn_aes128_encrypt:(NSString *)key;
-(NSData *)pn_aes128_decrypt:(NSString *)key;
- (NSString *)dataMD5;
@end
