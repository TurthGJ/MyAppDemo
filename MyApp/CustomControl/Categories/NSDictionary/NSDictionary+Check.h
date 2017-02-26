//
//  NSDictionary+Check.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/11/18.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Check)

/**
 *  判断字典是否为空
 *
 *  @param dict 字典对象
 *
 *  @return BOOL
 */
+ (BOOL)isNull:(NSDictionary *)dict;

@end
