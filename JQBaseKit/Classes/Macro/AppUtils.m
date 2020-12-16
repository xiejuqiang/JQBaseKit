//
//  AppUtils.m
//  JQBaseKit
//
//  Created by xiejuqiang on 2020/12/16.
//

#import "AppUtils.h"
#import <AdSupport/AdSupport.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation AppUtils
+ (NSString *)appVersionName{
    static NSString *versionName = @"";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        versionName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    });
    return  versionName;
}

+ (NSNumber *)appBuildCode{
    static NSString *buildCode = @"0";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        buildCode = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    });
    return  [NSNumber numberWithInteger:[buildCode integerValue]];
}

+ (NSString *)appDisplayName{
    static NSString *displayName = @"";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    });
    return displayName;
}

+ (NSString *)appBundleIdentifier{
    static NSString *bundleIdentifier = @"";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    });
    return bundleIdentifier;
}

+ (NSString *)appBundleName{
    static NSString *bundleName = @"";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundleName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
    });
    return bundleName;
}

+ (NSString *)idfa {
    NSString *idfaStr = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (idfaStr == nil) {
        return @"";
    }
    return idfaStr;
}

+ (NSString *)idfv {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

// 运营商
+ (NSString *)carrierName {
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    if (!carrier.isoCountryCode) {
        return @"";
    }
    return carrier.carrierName ? carrier.carrierName:@"";
}

@end
