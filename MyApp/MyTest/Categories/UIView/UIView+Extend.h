//
//  UIView+Extend.h
//  YZCommunity
//
//  Created by 曾治铭 on 15/9/2.
//  Copyright (c) 2015年 思丹元亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extend)

/**
 *  查找视图的视图控制器。
 *
 *  @param view 需要查找的视图
 *
 *  @return 返回视图的控制器
 */
+(UIViewController *)getControllerFromView:(UIView *)view;


/**
 *  将UIView转换为UIImage
 *
 *  @param view 传入UIView对象
 *
 *  @return 返回UIImage对象
 */
+(UIImage *)getImageFromView:(UIView *)view;


/**
 *  截取指定View区域的屏幕
 *
 *  @param view 传入UIView对象
 *
 *  @return 返回UIImage对象
 */
+(UIImage *)screenCaptureFromView:(UIView *)view;


/**
 *  截取View区域的屏幕
 *
 *  @return 返回UIImage对象
 */
-(UIImage *)screenCapture;

/**
 *  截取指定View区域的屏幕
 *
 *  @param view 传入UIView对象
 *
 *  @return 返回UIImage对象
 */
+(UIImage *)screenCapture:(CGRect )rect  inView:(UIView *)view;
@end
