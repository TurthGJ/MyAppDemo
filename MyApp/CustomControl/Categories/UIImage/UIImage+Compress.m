//
//  UIImage+Compress.m
//  YZCommunity
//
//  Created by 曾治铭 on 16/3/3.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import "UIImage+Compress.h"

@implementation UIImage (Compress)


/**
 *  压缩图片质量(尺寸不变)
 *
 *  @param sourceImage 源图片
 *  @param targetLength文件最大长度
 *
 *  @return 压缩后的图片
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage targetLength:(NSInteger)targetLength
{
    // 空值判断
    if (sourceImage == nil || targetLength <= 0) {
        return sourceImage;
    }
    
    CGFloat compression = 1.0f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(sourceImage, compression);
    while ([imageData length] > targetLength && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(sourceImage, compression);
    }
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}


/**
 *  等比压缩图片
 *
 *  @param sourceImage 源图片
 *  @param targetSize  目标大小
 *
 *  @return 压缩后的图片
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize
{
    // 空值判断
    if (sourceImage == nil || CGSizeEqualToSize(targetSize, CGSizeZero)) {
        return sourceImage;
    }
    
    // 获取源图片大小
    CGSize imageSize = sourceImage.size;
    
    // 如果源图片尺寸小于目标大小则不用压缩
    if (imageSize.width <= targetSize.width && imageSize.height <= targetSize.height) {
        return sourceImage;
    }
    
    // 计算倍速
    CGFloat widthFactor = targetSize.width / imageSize.width;
    CGFloat heightFactor = targetSize.height / imageSize.height;
    CGFloat scaleFactor = (widthFactor < heightFactor) ? widthFactor : heightFactor;
    
    // 计算图片宽高
    targetSize.width = imageSize.width * scaleFactor;
    targetSize.height = imageSize.height * scaleFactor;

    // 绘画图片
    UIGraphicsBeginImageContext(targetSize);
    [sourceImage drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
