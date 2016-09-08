//
//  DataUserDefaultsHelper.h
//  MyApp
//
//  Created by GJ on 16/8/30.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>

// 自动登录标记
#define AUTO_LOGIN_MARK_BOOL           @"AutoLoginMarkBool"

@interface DataUserDefaultsHelper : NSObject

+ (void)addUserDefaultsWithKey:(NSString *)key value:(id)value;

+ (void)removeUserDefaultsWithKey:(NSString *)key;

+ (id)readUserDefaultsWithKey:(NSString *)key;

@end
