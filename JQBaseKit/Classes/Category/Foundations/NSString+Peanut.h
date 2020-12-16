//
//  NSString+Peanut.h
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/8.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Peanut)

//转化为MD5字符串
- (NSString *)pn_stringForMD5;

//编码
- (NSString *)pn_encodeString;

//拼音简码
- (NSString *)pn_pinyinForBriefCode;

//拼音
- (NSString *)pn_pinyin;

//判断是否是数字
- (BOOL)pn_isNumber;

//是否是邮箱格式
- (BOOL)pn_validateEmail;

//是否是手机号
- (BOOL)pn_validatePhone;

//是否是合法字符 ：中英文、数字、空格、“-”、“_”
- (BOOL)pn_validateString;

//是否为空 ""
- (BOOL)pn_isEmpty;

//json 对象
- (id)pn_jsonObject;

//utf8编码字符长度
- (NSUInteger)pn_UTF8Length;

- (BOOL)pn_isContainsEmoji;

- (NSString *)pn_stringByClearEmoji;

//stringToInt
- (long)pn_hexInteger;

//26 -> 00:26 , 106 -> 01:46
+ (NSString *)pn_stringForTimeSeconds:(NSInteger)seconds;

- (BOOL)isValidPhoneNumber;

//文字竖排
- (NSString *)verticalString;


+ (NSString *)disableEmoji:(NSString *)text;

+ (CGFloat)calculateWidth:(NSString *)string font:(NSInteger)font;
@end


















