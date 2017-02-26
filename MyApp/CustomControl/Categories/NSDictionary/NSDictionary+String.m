//
//  NSDictionary+String.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/4.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSDictionary+String.h"
#import "NSObject+Check.h"

@implementation NSDictionary (String)



/**
 *  将字典转换为Json字符串
 *
 *  @return Json字符串
 */
- (NSString *)converToString
{
    return [NSDictionary converToStringWithDictionary:self];
}



/**
 *  将字典转换为Json字符串
 *
 *  @param dict 字典对象
 *
 *  @return Json字符串
 */
+ (NSString *)converToStringWithDictionary:(NSDictionary *)dict
{
    // 空值判断
    if ([NSObject isNullWithDictionary:dict]) {
        NSLog(@"--->字典转字符串失败，字典对象为空");
        return nil;
    }
    
    // 将字典转换为NSData, 并打印错误消息
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    if(error) {
        NSLog(@"--->字典转字符串失败：%@",error);
    }
    
    // 将NSData转字符串
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n  " withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@" : " withString:@":"];

    return jsonStr;
}






@end
