//
//  AFHttpNetHelperAPIClient.h
//  MyApp
//
//  Created by GJ on 16/8/18.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHttpNetHelperAPIClient : AFHTTPSessionManager

//宏定义成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(id data);
//宏定义失败block 回调失败信息
typedef void (^HttpFailure)(NSError *error);
//宏定义数据请求进度block
typedef void (^HttpProgress)(id progress);


+ (instancetype)shareManager;

- (void)POSTRequest:(NSString*)URLString parameters:(nullable id)parameters success:(HttpSuccess)success failure:(HttpFailure)failure progress:(HttpProgress)progress;

- (void)GETRequest:(NSString*)URLString parameters:(nullable id)parameters success:(HttpSuccess)success failure:(HttpFailure)failure progress:(HttpProgress)progress;

@end
