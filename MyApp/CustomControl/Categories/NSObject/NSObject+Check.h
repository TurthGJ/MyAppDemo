//
//  NSObject+Check.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/11/18.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Check.h"
#import "NSString+Check.h"
#import "NSArray+Check.h"
#import "NSData+Check.h"

@interface NSObject (Check)

/**
 *  判断对象是否为空
 *
 *  @param object 对象
 *
 *  @return BOOL
 */
+ (BOOL)isNullWithObject:(NSObject *)object;


/**
 *  判断Data是否为空
 *
 *  @param NSData 对象
 *
 *  @return BOOL
 */
+ (BOOL)isNullWithData:(NSData *)data;


/**
 *  判断字典是否为空
 *
 *  @param dict 字典对象
 *
 *  @return BOOL
 */
+ (BOOL)isNullWithDictionary:(NSDictionary *)dict;


/**
 *  判断数组是否为空
 *
 *  @param array 数组对象
 *
 *  @return BOOL
 */
+ (BOOL)isNullWithArray:(NSArray *)array;


/**
 *  判断字符串是否为空
 *
 *  @param str 字符串
 *
 *  @return BOOL
 */
+ (BOOL)isNullWithString:(NSString *)str;


/**
 *  判断是否为手机号
 *
 *  @param mobile 手机号
 *
 *  @return BOOL
 */
+ (BOOL)isMobileNumberWithString:(NSString *)mobile;


/**
 *  判断是否为手机号
 *
 *  @param mobile 手机号
 *
 *  @return BOOL
 */
+ (BOOL)isMobileNumberWithLong:(long long)mobile;




@end
