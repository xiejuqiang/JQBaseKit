//
//  SGVNetworkRequest.h
//  AFNetworking
//
//  Created by xiejuqiang on 2020/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SGVBaseRequest;
@class SGVBaseResponse;

@interface SGVNetworkRequest : NSObject

@property (nonatomic, copy) NSString *baseURLString;

+ (instancetype)shareNetworkRequest;

- (void)postRequest:(SGVBaseRequest *)baseQuest
      responseClass:(Class)responseClass
            apiPath:(NSString *)apiPath
            success:(void(^)(SGVBaseResponse *response))success
            failure:(void(^)(NSString *errorStr))failure;

- (void)getResponseClass:(Class)responseClass
                 apiPath:(NSString *)apiPath
                 success:(void(^)(SGVBaseResponse *response))success
                 failure:(void(^)(NSString *errorStr))failure;
@end

NS_ASSUME_NONNULL_END
