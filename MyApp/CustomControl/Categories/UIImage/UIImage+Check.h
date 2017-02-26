//
//  UIImage+Check.h
//  YZCommunity
//
//  Created by 曾治铭 on 16/1/6.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Check)


/**
 *  判断UIImage是否相等
 *
 *  @param image       图片
 *  @param referImage  参考图片
 *
 *  @return BOOL
 */
+ (BOOL)isEqualWithImage:(UIImage *)image referImage:(UIImage *)referImage;

/**
 *  判断UIImage是否相等
 *
 *  @param image 图片
 *
 *  @return BOOL
 */
- (BOOL)isEqualWithImage:(UIImage *)image;

@end
