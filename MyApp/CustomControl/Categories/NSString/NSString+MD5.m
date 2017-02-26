//
//  NSString+MD5.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/5.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)


/**
 *  获取MD5字符串
 */
- (NSString *)md5String
{
    return [NSString md5String:self];
}


/**
 *  获取MD5字符串
 */
+ (NSString *)md5String:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end
