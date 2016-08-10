//
//  UIButton+WebImage.m
//  YZCommunity
//
//  Created by 田思阳 on 15/12/21.
//  Copyright © 2015年 压寨团队. All rights reserved.
//

#import "UIButton+WebImage.h"
#import "CommonDefine.h"
//#import <UIButton+WebCache.h>

@implementation UIButton (WebImage)

- (void)setWebImageWithSubURLString:(NSString *)urlString placeholder:(UIImage *)placeholder
{
//    [self sd_setImageWithURL:[NSURL URLWithString:[DOWNURL stringByAppendingPathComponent:urlString]] forState:UIControlStateNormal placeholderImage:placeholder];
}

- (void)setWebImageWithSubURLString:(NSString *)urlString controlState:(UIControlState)state placeholder:(UIImage *)placeholder
{
//    [self sd_setImageWithURL:[NSURL URLWithString:[DOWNURL stringByAppendingPathComponent:urlString]] forState:state placeholderImage:placeholder];
}

- (void)setWebBackgroundImageWithSubURLString:(NSString *)urlString
{
    [self setWebBackgroundImageWithSubURLString:urlString controlState:UIControlStateNormal placeholder:nil];
}

- (void)setWebBackgroundImageWithSubURLString:(NSString *)urlString placeholder:(UIImage *)placeholder
{
    [self setWebBackgroundImageWithSubURLString:urlString controlState:UIControlStateNormal placeholder:placeholder];
}

- (void)setWebBackgroundImageWithSubURLString:(NSString *)urlString controlState:(UIControlState)state placeholder:(UIImage *)placeholder
{
//    [self sd_setBackgroundImageWithURL:[NSURL URLWithString:[DOWNURL stringByAppendingPathComponent:urlString]] forState:state placeholderImage:placeholder];
}

@end
