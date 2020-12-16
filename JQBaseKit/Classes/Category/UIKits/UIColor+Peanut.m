//
//  UIColor+Peanut.m
//  PeanutUIKit
//
//  Created by HarryQin on 2017/2/8.
//  Copyright © 2017年 Shenzhen Peanut Technology Co., Ltd. All rights reserved.
//

#import "UIColor+Peanut.h"

@implementation UIColor (Peanut)

+ (UIColor *)pn_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

+ (UIColor *)pn_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)pn_colorWithHex:(long)hex{
    return [self pn_colorWithHex:hex alpha:1.0f];
}

+ (UIColor *)pn_colorWithHex:(long)hex alpha:(CGFloat)alpha{
    float red = (float)((hex & 0xFF0000) >> 16);
    float green = (float)((hex & 0xFF00) >> 8);
    float blue = (float)(hex & 0xFF);
    return [UIColor pn_colorWithRed:red green:green blue:blue alpha:alpha];
}

+(UIColor *)pn_colorWithHexString:(NSString *)hexString{
    return [self pn_colorWithHexString:hexString alpha:1.0f];
}

+ (UIColor *)pn_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0x"] || [cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [self pn_colorWithRed:r green:g blue:b alpha:alpha];
}



+ (UIColor *)pn_getColorInLineCode:(NSString *)lineCode{
    
    NSString *  colorHexStr = @"d84580";
    if (1 == [lineCode integerValue]) {
        colorHexStr = @"ee8495";
    }else if (2 == [lineCode integerValue]){
        colorHexStr = @"f26464";
    }else if (3 == [lineCode integerValue]){
        colorHexStr = @"f98b75";
    }else if (4 == [lineCode integerValue]){
        colorHexStr = @"f18f4d";
    }else if (5 == [lineCode integerValue]){
        colorHexStr = @"fac15d";
    }else if (6 == [lineCode integerValue]){
        colorHexStr = @"c7c93a";
    }else if (7 == [lineCode integerValue]){
        colorHexStr = @"95c894";
    }else if (8 == [lineCode integerValue]){
        colorHexStr = @"38b087";
    }else if (9 == [lineCode integerValue]){
        colorHexStr = @"6fbdac";
    }else if (10 == [lineCode integerValue]){
        colorHexStr = @"1690b3";
    }else if (11 == [lineCode integerValue]){
        colorHexStr = @"72a4dc";
    }else if (12 == [lineCode integerValue]){
        colorHexStr = @"7360e3";
    }else if (13 == [lineCode integerValue]){
        colorHexStr = @"c694db";
    }else if (14 == [lineCode integerValue]){
        colorHexStr = @"d850d6";
    }else if (15 == [lineCode integerValue]){
        colorHexStr = @"e36dbb";
    }else if (16 == [lineCode integerValue]){
        colorHexStr = @"d84580";
    }
    return [self pn_colorWithHexString:colorHexStr];
    
}


+ (UIColor *)pn_getColorCityName:(NSString *)cityName inLineCode:(NSString *)lineCode{
    
    if ([cityName isEqualToString:@"上海"]) {
        NSString *  colorHexStr = @"B5B6B6";
        if (1 == [lineCode integerValue]) {
            colorHexStr = @"FF597D";
        }else if (2 == [lineCode integerValue]){
            colorHexStr = @"96D02A";
        }else if (3 == [lineCode integerValue]){
            colorHexStr = @"FFD500";
        }else if (4 == [lineCode integerValue]){
            colorHexStr = @"A78DC5";
        }else if (5 == [lineCode integerValue]){
            colorHexStr = @"C891C5";
        }else if (6 == [lineCode integerValue]){
            colorHexStr = @"F85AA6";
        }else if (7 == [lineCode integerValue]){
            colorHexStr = @"FF9535";
        }else if (8 == [lineCode integerValue]){
            colorHexStr = @"3BC1EC";
        }else if (9 == [lineCode integerValue]){
            colorHexStr = @"70CCF1";
        }else if (10 == [lineCode integerValue]){
            colorHexStr = @"CBAED7";
        }else if (11 == [lineCode integerValue]){
            colorHexStr = @"B85B6A";
        }else if (12 == [lineCode integerValue]){
            colorHexStr = @"0BA48E";
        }else if (13 == [lineCode integerValue]){
            colorHexStr = @"F894C2";
        }else if (16 == [lineCode integerValue]){
            colorHexStr = @"85D3BF";
        }else if (17 == [lineCode integerValue]){
            colorHexStr = @"C27269";
        }
        return [self pn_colorWithHexString:colorHexStr];
    }else if([cityName isEqualToString:@"广州"]){
        NSString *  colorHexStr = @"19D5F2";
        if (1 == [lineCode integerValue]) {
            colorHexStr = @"FFD500";
        }else if (2 == [lineCode integerValue]){
            colorHexStr = @"7EC3E6";
        }else if (3 == [lineCode integerValue]){
            colorHexStr = @"FF9535";
        }else if (4 == [lineCode integerValue]){
            colorHexStr = @"41B888";
        }else if (5 == [lineCode integerValue]){
            colorHexStr = @"F2608A";
        }else if (6 == [lineCode integerValue]){
            colorHexStr = @"C076A0";
        }else if (7 == [lineCode integerValue]){
            colorHexStr = @"96D02A";
        }else if (8 == [lineCode integerValue]){
            colorHexStr = @"67C5CC";
        }else if (9 == [lineCode integerValue]){
            colorHexStr = @"5ECFA8";
        }else if (13 == [lineCode integerValue]){
            colorHexStr = @"B2B586";
        }else if (14 == [lineCode integerValue]){
            colorHexStr = @"AE7176";
        }
        return [self pn_colorWithHexString:colorHexStr];
    }else if ([cityName isEqualToString:@"深圳"]){
        NSString *  colorHexStr = @"9D5574";
        if (1 == [lineCode integerValue]) {
            colorHexStr = @"00C985";
        }else if (2 == [lineCode integerValue]){
            colorHexStr = @"D67F5B";
        }else if (3 == [lineCode integerValue]){
            colorHexStr = @"00C3ED";
        }else if (4 == [lineCode integerValue]){
            colorHexStr = @"FA4357";
        }else if (5 == [lineCode integerValue]){
            colorHexStr = @"C07ABC";
        }else if (7 == [lineCode integerValue]){
            colorHexStr = @"5C89C3";
        }else if (9 == [lineCode integerValue]){
            colorHexStr = @"A2838A";
        }else if (11 == [lineCode integerValue]){
            colorHexStr = @"9D5574";
        }
        return [self pn_colorWithHexString:colorHexStr];
    }else if ([cityName isEqualToString:@"武汉"]){
        NSString *  colorHexStr = @"E26FC8";
        if (1 == [lineCode integerValue]) {
            colorHexStr = @"4FA4E6";
        }else if (2 == [lineCode integerValue]){
            colorHexStr = @"FC97C9";
        }else if (3 == [lineCode integerValue]){
            colorHexStr = @"DFA535";
        }else if (4 == [lineCode integerValue]){
            colorHexStr = @"8DCC00";
        }else if (6 == [lineCode integerValue]){
            colorHexStr = @"57D380";
        }else if (8 == [lineCode integerValue]){
            colorHexStr = @"86AFB8";
        }else if (11 == [lineCode integerValue]){
            colorHexStr = @"F2C200";
        }else if (21 == [lineCode integerValue]){
            colorHexStr = @"E26FC8";
        }
        return [self pn_colorWithHexString:colorHexStr];
    }else if ([cityName isEqualToString:@"青岛"]){
        NSString *  colorHexStr = @"8A95CC";
        if (2 == [lineCode integerValue]){
            colorHexStr = @"F76965";
        }else if (3 == [lineCode integerValue]){
            colorHexStr = @"4AAFDB";
        }else if (11 == [lineCode integerValue]){
            colorHexStr = @"8A95CC";
        }
        return [self pn_colorWithHexString:colorHexStr];
    }else if ([cityName isEqualToString:@"昆明"]){
        NSString *  colorHexStr = @"81AEBF";
        if (1 == [lineCode integerValue]) {
            colorHexStr = @"F76965";
        }else if (2 == [lineCode integerValue]){
            colorHexStr = @"72A9D6";
        }else if (3 == [lineCode integerValue]){
            colorHexStr = @"F476CB";
        }else if (6 == [lineCode integerValue]){
            colorHexStr = @"81AEBF";
        }
        return [self pn_colorWithHexString:colorHexStr];
    }else{
        return [self pn_getColorInLineCode:lineCode];
    }

}



@end
