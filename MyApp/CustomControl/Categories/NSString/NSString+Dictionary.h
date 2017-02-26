//
//  NSString+Dictionary.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/4.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Dictionary)


/**
 *  将JSON格式的字符串转换成字典
 *
 *  @return 返回字典
 */
- (NSDictionary *)converToDictionary;


/**
 *  将JSON格式的字符串转换成字典
 *
 *  @param jsonString JSON格式的字符串
 *
 *  @return 返回字典
 */
+ (NSDictionary *)converToDictionaryWithJsonString:(NSString *)jsonString;


@end
