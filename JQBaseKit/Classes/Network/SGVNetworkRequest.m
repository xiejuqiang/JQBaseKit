//
//  SGVNetworkRequest.m
//  AFNetworking
//
//  Created by xiejuqiang on 2020/12/14.
//

#import "SGVNetworkRequest.h"
#import <AFNetworking/AFNetworking.h>
#import <CommonCrypto/CommonDigest.h>
#import <YYModel/YYModel.h>
#import "SGVBaseRequest.h"
#import "SGVBaseResponse.h"

@interface SGVNetworkRequest ()
@property(nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation SGVNetworkRequest
static SGVNetworkRequest *shareInstance = nil;
+ (instancetype)shareNetworkRequest{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SGVNetworkRequest alloc] init];
       
    });
    return shareInstance;
}

- (instancetype)init{
    if (self = [super init]) {
        self.manager = [AFHTTPSessionManager manager];
        //这三行必须要配置
        NSSet *contentTypes = [NSSet setWithArray:@[@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", @"application/x-protobuf", @"suggestion/json"]];
        self.manager.responseSerializer.acceptableContentTypes = contentTypes;
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];//json请求类型
        self.manager.requestSerializer.timeoutInterval = 10.0;

    }
    return self;
}

- (void)setBaseURLString:(NSString *)baseURLString {
    _baseURLString = baseURLString;
}


- (void)postRequest:(SGVBaseRequest *)baseQuest
      responseClass:(Class)responseClass
            apiPath:(NSString *)apiPath
            success:(void(^)(SGVBaseResponse *response))success
            failure:(void(^)(NSString *errorStr))failure{
    NSString *url = [NSString stringWithFormat:@"%@%@", _baseURLString, apiPath];
    NSDictionary *parameters = [baseQuest yy_modelToJSONObject];
    NSLog(@"url = %@, parameters = %@", url, parameters);
    [self.manager POST:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSString *responStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"url = %@, responStr = %@", url, responStr);
        SGVBaseResponse *respon = [responseClass yy_modelWithJSON:responStr];
        success(respon);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.description);
    }];
}

- (void)getResponseClass:(Class)responseClass
                 apiPath:(NSString *)apiPath
                 success:(void(^)(SGVBaseResponse *response))success
                 failure:(void(^)(NSString *errorStr))failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@", _baseURLString, apiPath];
    NSLog(@"GetResponse url = %@", url);
    
    [self.manager GET:url parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *responStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"url = %@, responStr = %@", url, responStr);
        SGVBaseResponse *respon = [responseClass yy_modelWithJSON:responStr];
        success(respon);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.description);
    }];
    
}

@end
