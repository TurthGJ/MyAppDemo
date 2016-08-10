//
//  NSDictionary+UTF8.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/29.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSDictionary+UTF8.h"
#import "NSDictionary+Check.h"

@implementation NSDictionary (UTF8)


/**
 *  将字典转换为UTF8格式
 *
 *  @return UTF8格式的字典对象
 */
+ (NSDictionary *)encodeUTF8WithDictionary:(NSDictionary *)dict
{
    // 空值判断
    if ([NSDictionary isNull:dict]) {
        NSLog(@"---将字典转换为UTF8格式失败, 字典对象为空");
       return nil;
    }
    
    // 将字典转NSData
    NSData *dictData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    // 将NSData转字符串
    NSString *dictStr = [[NSString alloc] initWithData:dictData encoding:NSUTF8StringEncoding];
    // 将字符串转为UTF8编码
    NSString *utf8Str = [dictStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    // 将字符串转NSData
    NSData *utf8Data = [utf8Str dataUsingEncoding:NSUTF8StringEncoding];
    // 将NSData转字典
    NSDictionary *utf8Dict = [NSJSONSerialization JSONObjectWithData:utf8Data options:NSJSONReadingMutableContainers error:nil];
    // 返回UTF8编码的字典
    return utf8Dict;
}


/**
 *  将字典转换为UTF8格式
 *
 *  @return UTF8格式的字典对象
 */
- (NSDictionary *)encodeUTF8
{
    return [NSDictionary encodeUTF8WithDictionary:self];
}


/**
 *  打印字典（中文编码）
 *
 *  @param dict 字典对象
 */
+(void)printUTF8WithDict:(NSDictionary *)dict
{
    if ([NSDictionary isNull:dict]) {
        return;
    }
    NSString *tempStr1 = [[dict description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *strUTF8 = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    NSLog(@"--->PrintUTF8Dict:\n%@",strUTF8);
}


/**
 *  中文编码格式打印字典
 */
-(void)printUTF8
{
    [NSDictionary printUTF8WithDict:self];
}

@end
