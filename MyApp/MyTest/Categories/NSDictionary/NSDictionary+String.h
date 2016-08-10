//
//  NSDictionary+String.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/4.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (String)


/**
 *  将字典转换为Json字符串
 *
 *  @return Json字符串
 */
- (NSString *)converToString;



/**
 *  将字典转换为Json字符串
 *
 *  @param dict 字典对象
 *
 *  @return Json字符串
 */
+ (NSString *)converToStringWithDictionary:(NSDictionary *)dict;




@end
