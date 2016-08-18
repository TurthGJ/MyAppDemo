//
//  AFHttpNetHelperAPIClient.m
//  MyApp
//
//  Created by GJ on 16/8/18.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "AFHttpNetHelperAPIClient.h"
#import "CommonDefine.h"

@implementation AFHttpNetHelperAPIClient

+ (instancetype)shareManager
{
    static AFHttpNetHelperAPIClient* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AFHttpNetHelperAPIClient alloc]initWithBaseURL:[NSURL URLWithString:DEFAULT_BASE_API_URL_STRING]];
    });
    return instance;
}


- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer.timeoutInterval = 15;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        [self.requestSerializer setValue:@"x-www-form-urlencoded" forHTTPHeaderField:@"If-None-Match"];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/javascript",@"text/json",@"text/html",@"image/*",nil];
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}


- (void)GETRequest:(NSString*)URLString parameters:(nullable id)parameters success:(HttpSuccess)success failure:(HttpFailure)failure progress:(HttpProgress)progress
{
    if([URLString isEqual:nil])
        return;
    [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


- (void)POSTRequest:(NSString*)URLString parameters:(nullable id)parameters success:(HttpSuccess)success failure:(HttpFailure)failure progress:(HttpProgress)progress
{
    if([URLString isEqual:nil])
        return;
    [self POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress)
            progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
            success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
            failure(error);
    }];
}

- (void)uploadWithImage:(UIImage *)image
                    url:(NSString *)url
               filename:(NSString *)filename
                   name:(NSString *)name
                 params:(NSDictionary *)params
               progress:(HttpProgress)progress
                success:(HttpSuccess)success
                   fail:(HttpFailure)fail
{
    if([url isEqual:nil])
        return;
    [self POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if([name isEqualToString:@"JEPG"])
        {
            NSData* imageData = UIImageJPEGRepresentation(image, 1.0);
            NSString* imgfileNmae = filename;
            if([filename isEqual:nil]||![filename isKindOfClass:[NSString class]]||filename.length == 0)
            {
                NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
                formatter.dateFormat = @"yyyyMMDDHHmmss";
                NSString* str = [formatter stringFromDate:[NSDate date]];
                imgfileNmae = [NSString stringWithFormat:@"%@.jpg",str];
            }
            [formData appendPartWithFileData:imageData name:name fileName:filename mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}

- (void)dowloadWithUrl:(NSString *)url
            saveToPath:(NSString *)saveToPath
              progress:(HttpProgress)progressBlock
               success:(HttpSuccess)success
               failure:(HttpFailure)failure
{
    if([url isEqual:nil])
        return;
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        progressBlock(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        if ([saveToPath isEqual:nil]||saveToPath.length < 1) {
            NSURL *downloadURL = [[NSFileManager defaultManager]URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            return [downloadURL URLByAppendingPathComponent:[response suggestedFilename]];
        }
        else
        {
            return [NSURL fileURLWithPath:saveToPath];
        }
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error == nil) {
            if (success) {
                success([filePath path]);
            }
        }
        else
        {
            if (failure) {
                failure(error);
            }
        }
    }];
}

@end
