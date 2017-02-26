//
//  UIImageView+WebImage.h
//  YZCommunity
//
//  Created by 田思阳 on 15/12/21.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebImage)

// 设置网络图片
- (void)setWebImageWithSubURLString:(NSString *)urlString placeholder:(UIImage *)placeholder;

@end
