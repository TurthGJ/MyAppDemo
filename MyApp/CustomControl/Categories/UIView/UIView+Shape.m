//
//  UIView+Shape.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/10/11.
//  Copyright (c) 2015年 压寨团队. All rights reserved.
//

#import "UIView+Shape.h"

@implementation UIView (Shape)

/**
 *  通过图片设置性状
 *
 *  @param maskImage 遮罩图片
 */
- (void) setShapeWithImage:(UIImage *)maskImage
{
    CAShapeLayer *maskLayer  = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.contentsScale = [UIScreen mainScreen].scale;
    maskLayer.contents = (id)maskImage.CGImage;
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
}

/**
 *  通过图片设置性状
 *
 *  @param maskImage 遮罩图片
 */
- (void) setShapeWithImage:(UIImage *)maskImage  withOriginalImage:(UIImage *)orignalImage
{
    CAShapeLayer *maskLayer  = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.contentsScale = [UIScreen mainScreen].scale;
    maskLayer.contents = (id)orignalImage.CGImage;
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
}





/**
 *  通过PathRef设置性状
 *
 *  @param path PathRef
 */
- (void) setShapeWithPath:(CGPathRef)path
{
    CAShapeLayer *maskLayer  = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.contentsScale = [UIScreen mainScreen].scale;
    maskLayer.path = path;
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
}

@end
