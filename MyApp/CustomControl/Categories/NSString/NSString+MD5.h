//
//  NSString+MD5.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/5.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/**
 *  获取MD5字符串
 */
- (NSString *)md5String;


/**
 *  获取MD5字符串
 */
+ (NSString *)md5String:(NSString *)str;


@end
