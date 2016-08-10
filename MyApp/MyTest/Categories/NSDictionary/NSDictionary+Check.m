//
//  NSDictionary+Check.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/11/18.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSDictionary+Check.h"

@implementation NSDictionary (Check)

/**
 *  判断字典是否为空
 *
 *  @param dict 字典对象
 *
 *  @return BOOL
 */
+ (BOOL)isNull:(NSDictionary *)dict
{
    if (dict == nil || dict == NULL) {
        return YES;
    }
    if ([dict isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (dict == [NSDictionary alloc])
    {
        return YES;
    }
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    if (dict.count == 0)
    {
        return YES;
    }
    
    return NO;
}

@end
