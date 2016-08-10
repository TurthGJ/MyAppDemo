//
//  NSString+Format.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/12/18.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)

/**
 *  将对象数据转换为字符串
 *
 *  @param obj Object 对象（不能用于基本数据类型）
 *
 *  @return 字符串，如果为nil则为空字符串
 */
+ (NSString *)stringWithObject:(id)obj;

@end
