//
//  UIView+Shape.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/10/11.
//  Copyright (c) 2015年 压寨团队. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shape)

/**
 *  通过图片设置性状
 *
 *  @param maskImage 遮罩图片
 */
- (void) setShapeWithImage:(UIImage *)maskImage;

/**
 *  通过图片设置性状
 *
 *  @param maskImage 遮罩图片
 */
- (void) setShapeWithImage:(UIImage *)maskImage  withOriginalImage:(UIImage *)orignalImage;


/**
 *  通过PathRef设置性状
 *
 *  @param path PathRef
 */
- (void) setShapeWithPath:(CGPathRef)path;

@end
