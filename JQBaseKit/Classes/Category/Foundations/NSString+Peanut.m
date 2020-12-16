//
//  NSString+Peanut.m
//  PeanutFoundation
//
//  Created by HarryQin on 2017/2/8.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "NSString+Peanut.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Peanut)

- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self respondsToSelector:[invocation selector]]) {
        [invocation invokeWithTarget:self];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *sig = [[NSString class] instanceMethodSignatureForSelector:selector];
    if(sig == nil) {
        sig = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    }
    return sig;
}

//MD5加密
- (NSString *)pn_stringForMD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//编码
- (NSString*)pn_encodeString
{
    CFStringRef newString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    if (newString) {
        NSString * str =  (__bridge NSString *)newString;
        CFRelease(newString);
        return str;
    }
    return @"";
}

//拼音简码
- (NSString *)pn_pinyinForBriefCode
{
    NSInteger length = self.length;
    if (length == 0) {
        return @"";
    }
    NSMutableString *result = [[NSMutableString alloc] init];
    for (NSInteger index = 0; index < length; index++) {
        NSString *temp = [self substringWithRange:NSMakeRange(index, 1)];
        temp = [temp pn_pinyin];
        temp = [[NSString stringWithFormat:@"%c",[temp characterAtIndex:0]] uppercaseString];
        [result appendString:temp];
    }
    return [NSString stringWithString:result];
}

//拼音
- (NSString *)pn_pinyin
{
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripDiacritics, false);
    return mutableString;
}

//判断是否是数字
- (BOOL)pn_isNumber
{
    NSArray *nums = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    return [nums containsObject:self];
}

//是否是邮箱格式
- (BOOL)pn_validateEmail
{
    if (self == nil) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

//是否是手机号格式
- (BOOL)pn_validatePhone
{
    NSString * MOBILE = @"^1\\d{10}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

//是否是合法字符 ：中英文、数字、空格、“-”、“_”
- (BOOL)pn_validateString
{
    NSString * regex = @"([\u4e00-\u9fa5]|[A-Za-z0-9]|[ _-])+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

//是否为空
- (BOOL)pn_isEmpty
{
    return self.length == 0;
}

- (id)pn_jsonObject
{
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    return object;
}

- (NSUInteger)pn_UTF8Length
{
    const char *cStr = [self UTF8String];
    return strlen(cStr);
}

- (BOOL)pn_isContainsEmoji
{
    return [self pn_emojis].count > 0;
}

- (NSString *)pn_stringByClearEmoji
{
    NSArray *emojis = [self pn_emojis];
    NSString *str = [self copy];
    for (NSString *emoji in emojis) {
        str = [str stringByReplacingOccurrencesOfString:emoji withString:@""];
    }
    return str;
}

- (NSArray *)pn_emojis
{
    __block BOOL isEomji = NO;
    __block NSMutableArray *emojis = [NSMutableArray array];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 isEomji = YES;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
         if (isEomji) {
             [emojis addObject:substring];
             isEomji = NO;
         }
     }];
    return emojis;
}

- (long)pn_hexInteger {
    return hex2dec([self UTF8String]);
}

int c2i(char ch)
{
    // 如果是数字，则用数字的ASCII码减去48, 如果ch = '2' ,则 '2' - 48 = 2
    if(isdigit(ch))
        return ch - 48;
    
    // 如果是字母，但不是A~F,a~f则返回
    if( ch < 'A' || (ch > 'F' && ch < 'a') || ch > 'z' )
        return -1;
    
    // 如果是大写字母，则用数字的ASCII码减去55, 如果ch = 'A' ,则 'A' - 55 = 10
    // 如果是小写字母，则用数字的ASCII码减去87, 如果ch = 'a' ,则 'a' - 87 = 10
    if(isalpha(ch))
        return isupper(ch) ? ch - 55 : ch - 87;
    
    return -1;
}

int hex2dec(const char *hex)
{
    int len;
    int num = 0;
    int temp;
    int bits;
    int i;
    
    // 此例中 hex = "1de" 长度为3, hex是main函数传递的
    len = (int)strlen(hex);
    
    for (i=0, temp=0; i<len; i++, temp=0)
    {
        // 第一次：i=0, *(hex + i) = *(hex + 0) = '1', 即temp = 1
        // 第二次：i=1, *(hex + i) = *(hex + 1) = 'd', 即temp = 13
        // 第三次：i=2, *(hex + i) = *(hex + 2) = 'd', 即temp = 14
        temp = c2i( *(hex + i) );
        // 总共3位，一个16进制位用 4 bit保存
        // 第一次：'1'为最高位，所以temp左移 (len - i -1) * 4 = 2 * 4 = 8 位
        // 第二次：'d'为次高位，所以temp左移 (len - i -1) * 4 = 1 * 4 = 4 位
        // 第三次：'e'为最低位，所以temp左移 (len - i -1) * 4 = 0 * 4 = 0 位
        bits = (len - i - 1) * 4;
        temp = temp << bits;
        
        // 此处也可以用 num += temp;进行累加
        num = num | temp;
    }
    
    // 返回结果
    return num;
}

//26 -> 00:26 , 106 -> 01:46
+ (NSString *)pn_stringForTimeSeconds:(NSInteger)seconds {
    NSInteger mins = seconds / 60;
    NSInteger secs = seconds % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld",(long)mins,(long)secs];
}

- (BOOL)isValidPhoneNumber {
    if (self.length != 11){
        return NO;
    }
    if (![self hasPrefix:@"1"]) {
        return NO;
    }
//    // 移动
//    NSString *CM_NUM = @"^((13[4-9])|(14[7-8])|(15[0-2,7-9])|(17[2,8])|(18[2-4,7-8])|(198))\\d{8}|(1705)\\d{7}$";
//    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
//    BOOL isMatch1 = [pred1 evaluateWithObject:self];
//    // 联通
//    NSString *CU_NUM = @"^((13[0-2])|(14[5-6])|(15[5-6])|(166)|(17[0-1,5-6])|(18[5,6]))\\d{8}|(1709)\\d{7}$";
//    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
//    BOOL isMatch2 = [pred2 evaluateWithObject:self];
//    // 电信
//    NSString *CT_NUM = @"^((133)|(149)|(153)|(17[3-4])|(177)|(18[0,1,9])|(199))\\d{8}$";
//    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
//    BOOL isMatch3 = [pred3 evaluateWithObject:self];
//    
//    if (isMatch1 || isMatch2 || isMatch3) {
//        return YES;
//    } else {
//        return NO;
//    }
    return YES;
}


- (NSString *)verticalString{
    NSMutableString * str = [[NSMutableString alloc] initWithString:self];
    
    NSString * numStr = @"";
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:str
                                                                       options:NSMatchingReportProgress
                                                                         range:NSMakeRange(0, str.length)];

    if (tNumMatchCount > 0) {
        //从开始截取
        numStr = [str substringToIndex:tNumMatchCount].mutableCopy;
    }
    
    
    
   //若是需要判断后面的数字不在字串前面使用Range方法
    
    NSInteger count = str.length;
    for(int i = 1; i < count; i ++) {
        if (i == numStr.length&&numStr.length>0) {
            [str insertString:@"\n" atIndex:numStr.length];
        }else if (i > numStr.length&&numStr.length>0){
            [str insertString:@"\n" atIndex:(2*(i-numStr.length) + numStr.length)];
        }
        if (numStr.length == 0) {
            [str insertString:@"\n" atIndex:i*2 - 1];
        }
    }
    return str;
}


+ (NSString *)disableEmoji:(NSString *)text

{
    
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSString *modifiedString = [regular stringByReplacingMatchesInString:text options:NSMatchingReportProgress range:NSMakeRange(0, [text length]) withTemplate:@""];
    
    return modifiedString;
    
}

+ (CGFloat)calculateWidth:(NSString *)string font:(NSInteger)font {
    NSDictionary *btAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    CGSize btSize = [string sizeWithAttributes:btAtt];
    return btSize.width;
}



@end











