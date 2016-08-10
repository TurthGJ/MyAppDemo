//
//  NSArray+Check.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/11/18.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "NSArray+Check.h"

@implementation NSArray (Check)

/**
 *  判断数组是否为空
 *
 *  @param array 数组对象
 *
 *  @return BOOL
 */
+ (BOOL)isNull:(NSArray *)array
{
    if (array == nil || array == NULL) {
        return YES;
    }
    if ([array isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (array == [NSArray alloc])
    {
        return YES;
    }
    if (![array isKindOfClass:[NSArray class]]) {
        return YES;
    }
    if (array.count == 0)
    {
        return YES;
    }
    
    return NO;
}



@end
