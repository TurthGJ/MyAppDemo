//
//  NSString+Dictionary.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/4.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSString+Dictionary.h"
#import "NSObject+Check.h"

@implementation NSString (Dictionary)


/**
 *  将JSON格式的字符串转换成字典
 *
 *  @return 返回字典
 */
- (NSDictionary *)converToDictionary
{
    return [NSString converToDictionaryWithJsonString:self];
}


/**
 *  将JSON格式的字符串转换成字典
 *
 *  @param jsonString JSON格式的字符串
 *
 *  @return 返回字典
 */
+ (NSDictionary *)converToDictionaryWithJsonString:(NSString *)jsonString
{
    // 空值判断
    if ([NSObject isNullWithString:jsonString]) {
        NSLog(@"--->Json字符串转字典失败，Json字符串为空");
        return nil;
    }
    
    // 将字符串转为NSData
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 将NSData转换为字典, 并打印错误消息
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        NSLog(@"--->Json字符串转字典失败：%@",error);
    }
    
    // 返回字典
    return jsonDict;
}




@end
