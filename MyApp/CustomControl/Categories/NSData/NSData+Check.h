//
//  NSData+Check.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/1.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Check)

/**
 *  判断Data是否为空
 *
 *  @param NSData 对象
 *
 *  @return BOOL
 */
+ (BOOL)isNull:(NSData *)data;

@end
