//
//  DataArchiveHelper.m
//  MyApp
//
//  Created by GJ on 16/8/25.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "DataArchiveHelper.h"

@interface DataArchiveHelper()
{
    NSMutableDictionary* mCommonInfosDict;
}

@end

@implementation DataArchiveHelper

- (instancetype)shareInstance
{
    static DataArchiveHelper* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataArchiveHelper alloc]init];
    });
    return instance;
}

- (void)addCommonInfosWithKey:(NSString*)key value:(id)value
{
    if ([key isEqual:nil]||[value isEqual:nil]) {
        return;
    }
    if (!mCommonInfosDict) {
        mCommonInfosDict = [NSMutableDictionary dictionary];
    }
    
    [mCommonInfosDict setObject:value forKey:key];
    [self archiveData];
}

- (id)readCommonInfosWithKey:(NSString*)key
{
    if ([key isEqual:nil]) {
        return nil;
    }
    
    if (!mCommonInfosDict) {
        mCommonInfosDict = [NSMutableDictionary dictionary];
    }
    
    return [mCommonInfosDict objectForKey:key];
    
}

- (void)removeCommonInfosWithKey:(NSString*)key
{
    if ([key isEqual:nil]) {
        return;
    }
    
    if (!mCommonInfosDict) {
        mCommonInfosDict = [NSMutableDictionary dictionary];
    }
    
    [mCommonInfosDict removeObjectForKey:key];
    [self archiveData];
}

- (void)archiveData
{
    [NSKeyedArchiver archiveRootObject:mCommonInfosDict toFile:[self getArchiveFilePath]];
}

- (void)unarchiveData
{
    id unarchivedata = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getArchiveFilePath]];
    if (unarchivedata && [unarchivedata isKindOfClass:[NSDictionary class]]) {
        mCommonInfosDict = [NSMutableDictionary dictionaryWithDictionary:unarchivedata];
    }
    else
        mCommonInfosDict = [NSMutableDictionary dictionary];
}

#pragma mark -- private method

- (NSString*)getArchiveFilePath
{
    static NSString* filePath;
    if (!filePath||filePath.length <= 0) {
        NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
        filePath = [documentPath stringByAppendingString:@"CommonInfos.arc"];
    }
    return filePath;
}

@end
