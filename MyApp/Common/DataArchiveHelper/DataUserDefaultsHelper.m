//
//  DataUserDefaultsHelper.m
//  MyApp
//
//  Created by GJ on 16/8/30.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "DataUserDefaultsHelper.h"
#import "NSObject+Check.h"
#import "CommonDefine.h"

@implementation DataUserDefaultsHelper

/**
 *  添加UserDefaults信息
 *
 *  @param key   关键字标示
 *  @param value 值数据
 */
+ (void)addUserDefaultsWithKey:(NSString *)key value:(id)value
{
    // 空值判断
    if([NSObject isNullWithString:key] || value == nil){
        DLOG(@"--->添加UserDefaults信息失败，key或value为空");
        return;
    }
    
    // 修添加NSUserDefaults数据
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}


/**
 *  移除UserDefaults信息
 *
 *  @param key 关键字标示
 */
+ (void)removeUserDefaultsWithKey:(NSString *)key
{
    // 空值判断
    if ([NSObject isNullWithString:key]) {
        DLOG(@"--->移除UserDefaults信息失败，key为空");
    }
    
    // 修改NSUserDefaults数据
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}


/**
 *  读取UserDefaults信息
 *
 *  @param key 关键字标示
 *
 *  @return 值数据
 */
+ (id)readUserDefaultsWithKey:(NSString *)key
{
    // 空值判断
    if ([NSObject isNullWithString:key]) {
        DLOG(@"--->读取UserDefaults信息失败，key为空");
        return nil;
    }
    
    // 读取NSUserDefaults数据
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    id value = [userDefaults objectForKey:key];
    
    return value;
}

@end
