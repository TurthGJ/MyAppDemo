//
//  NSData+Check.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/1.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSData+Check.h"

@implementation NSData (Check)

/**
 *  判断Data是否为空
 *
 *  @param NSData 对象
 *
 *  @return BOOL
 */
+ (BOOL)isNull:(NSData *)data
{
    if (data == nil || data == NULL) {
        return YES;
    }
    if ([data isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (data == [NSData alloc])
    {
        return YES;
    }
    if (![data isKindOfClass:[NSData class]])
    {
        return YES;
    }
    if (data.length == 0) {
        return YES;
    }
    
    return NO;
}

@end
