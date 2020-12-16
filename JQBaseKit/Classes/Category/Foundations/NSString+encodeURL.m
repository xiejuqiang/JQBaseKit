//
//  NSString+encodeURL.m
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/13.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "NSString+encodeURL.h"

@implementation NSString (encodeURL)

+ (NSString *)encodeURL:(NSString *)urlString {
    
    NSString *deleteSpaceStr = [urlString stringByReplacingOccurrencesOfString:@" " withString:@""];//去空格
    NSString *charactersToEscape = @"<>[]^`{|\" ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodeString = [deleteSpaceStr stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    
    return encodeString;
}

+ (NSString *)allEncodeUrl:(NSString *)urlString {
    NSString *deleteSpaceStr = [urlString stringByReplacingOccurrencesOfString:@" " withString:@""];//去空格
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodeString = [deleteSpaceStr stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodeString;
}

+ (NSString *)decodeURL:(NSString *)urlString {
    NSString *decodeString = [urlString stringByRemovingPercentEncoding];
    return decodeString;
}

@end
