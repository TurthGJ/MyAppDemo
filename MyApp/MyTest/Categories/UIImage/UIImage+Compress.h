//
//  UIImage+Compress.h
//  YZCommunity
//
//  Created by 曾治铭 on 16/3/3.
//  Copyright © 2016年 压寨团队. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

/**
 *  压缩图片质量(尺寸不变)
 *
 *  @param sourceImage 源图片
 *  @param targetLength文件最大长度
 *
 *  @return 压缩后的图片
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage targetLength:(NSInteger)targetLength;


/**
 *  等比压缩图片
 *
 *  @param sourceImage 源图片
 *  @param targetSize  目标大小
 *
 *  @return 压缩后的图片
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;

@end
