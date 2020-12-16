//
//  AppUtils.h
//  JQBaseKit
//
//  Created by xiejuqiang on 2020/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppUtils : NSObject
+ (NSString *)appVersionName;
+ (NSNumber *)appBuildCode;
+ (NSString *)appDisplayName;
+ (NSString *)appBundleIdentifier;
+ (NSString *)appBundleName;
+ (NSString *)idfa;
+ (NSString *)idfv;
@end

NS_ASSUME_NONNULL_END
