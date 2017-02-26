//
//  UIView+Extend.m
//  YZCommunity
//
//  Created by 曾治铭 on 15/9/2.
//  Copyright (c) 2015年 思丹元亨. All rights reserved.
//

#import "UIView+Extend.h"

@implementation UIView (Extend)

/**
 *  查找视图的视图控制器。
 *
 *  @param view 需要查找的视图
 *
 *  @return 返回视图的控制器
 */
+(UIViewController *)getControllerFromView:(UIView *)view{
    // 遍历响应者链。返回第一个找到视图控制器
    UIResponder *responder = view;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: [UIViewController class]]){
            return (UIViewController *)responder;
        }
    }
    // 如果没有找到则返回nil
    return nil;
}


/**
 *  将UIView转换为UIImage
 *
 *  @param view 传入UIView对象
 *
 *  @return 返回UIImage对象
 */
+(UIImage *)getImageFromView:(UIView *)view{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/**
 *  截取指定View区域的屏幕
 *
 *  @param view 传入UIView对象
 *
 *  @return 返回UIImage对象
 */
+(UIImage *)screenCaptureFromView:(UIView *)view
{
    // 获取当前Controller的View
    UIView *ctrlView = [self getControllerFromView:view].view;
    
    // 截取屏幕图片
    UIGraphicsBeginImageContextWithOptions(ctrlView.bounds.size, NO, [UIScreen mainScreen].scale);
    [ctrlView drawViewHierarchyInRect:ctrlView.bounds afterScreenUpdates:YES];
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(screenImage, nil, nil, nil); // 写入图像到相册
    
    // 获取view在ctrlView中的坐标
    CGRect viewRect = [ctrlView convertRect:view.frame fromView:view.superview];
    
    // 计算剪切Rect
    CGRect cutRect = CGRectMake(viewRect.origin.x * screenImage.scale,
                                viewRect.origin.y * screenImage.scale,
                                viewRect.size.width * screenImage.scale,
                                viewRect.size.height * screenImage.scale);
    
    // 剪切图片
    CGImageRef imageRef = CGImageCreateWithImageInRect(screenImage.CGImage, cutRect);
    UIImage *cutImage = [UIImage imageWithCGImage:imageRef scale:screenImage.scale orientation:screenImage.imageOrientation];
    CGImageRelease(imageRef);

    return cutImage;
}


/**
 *  截取指定View区域的屏幕
 *
 *  @param view 传入UIView对象
 *
 *  @return 返回UIImage对象
 */
+(UIImage *)screenCapture:(CGRect )rect  inView:(UIView *)view
{
    // 截取屏幕图片
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(screenImage, nil, nil, nil); // 写入图像到相册
    
    // 获取view在ctrlView中的坐标
    CGRect viewRect = rect;
    // 计算剪切Rect
    CGRect cutRect = CGRectMake(viewRect.origin.x * screenImage.scale,
                                viewRect.origin.y * screenImage.scale,
                                viewRect.size.width * screenImage.scale,
                                viewRect.size.height * screenImage.scale);
    
    // 剪切图片
    CGImageRef imageRef = CGImageCreateWithImageInRect(screenImage.CGImage, cutRect);
    UIImage *cutImage = [UIImage imageWithCGImage:imageRef scale:screenImage.scale orientation:screenImage.imageOrientation];
    CGImageRelease(imageRef);
    
    return cutImage;
}



/**
 *  截取View区域的屏幕
 *
 *  @return 返回UIImage对象
 */
-(UIImage *)screenCapture
{
    return [UIView screenCaptureFromView:self];
}



@end
