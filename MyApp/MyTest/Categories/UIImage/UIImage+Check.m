//
//  UIImage+Check.m
//  YZCommunity
//
//  Created by 曾治铭 on 16/1/6.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import "UIImage+Check.h"

@implementation UIImage (Check)

/**
 *  判断UIImage是否相等
 *
 *  @param image       图片
 *  @param referImage  参考图片
 *
 *  @return BOOL
 */
+ (BOOL)isEqualWithImage:(UIImage *)image referImage:(UIImage *)referImage
{
    NSData *data1 = UIImagePNGRepresentation(image);
    NSData *data2 = UIImagePNGRepresentation(referImage);
    if ([data1 isEqual:data2]) {
        return YES;
    }
    return NO;
}

/**
 *  判断UIImage是否相等
 *
 *  @param image 图片
 *
 *  @return BOOL
 */
- (BOOL)isEqualWithImage:(UIImage *)image
{
    return [UIImage isEqualWithImage:self referImage:image];
}

@end
