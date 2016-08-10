//
//  NSDictionary+UTF8.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/29.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (UTF8)



/**
 *  将字典转换为UTF8格式
 *
 *  @return UTF8格式的字典对象
 */
+ (NSDictionary *)encodeUTF8WithDictionary:(NSDictionary *)dict;


/**
 *  将字典转换为UTF8格式
 *
 *  @return UTF8格式的字典对象
 */
- (NSDictionary *)encodeUTF8;


/**
 *  打印字典（中文编码）
 *
 *  @param dict 字典对象
 */
+(void)printUTF8WithDict:(NSDictionary *)dict;


/**
 *  中文编码格式打印字典
 */
-(void)printUTF8;

@end
