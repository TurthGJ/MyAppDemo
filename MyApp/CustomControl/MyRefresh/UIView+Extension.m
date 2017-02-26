//
//  UIView+Extension.m
//  MyApp
//
//  Created by GJ on 16/8/12.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setMr_x:(CGFloat)mr_x
{
    CGRect frame = self.frame;
    frame.origin.x = mr_x;
    self.frame = frame;
}

- (CGFloat)mr_x
{
    return self.frame.origin.x;
}

- (void)setMr_y:(CGFloat)mr_y
{
    CGRect frame = self.frame;
    frame.origin.x = mr_y;
    self.frame = frame;
}

- (CGFloat)mr_y
{
    return self.frame.origin.y;
}

- (void)setMr_w:(CGFloat)mr_w
{
    CGRect frame = self.frame;
    frame.size.width = mr_w;
    self.frame = frame;
}

- (CGFloat)mr_w
{
    return self.frame.size.width;
}

- (void)setMr_h:(CGFloat)mr_h
{
    CGRect frame = self.frame;
    frame.size.height = mr_h;
    self.frame = frame;
}

- (CGFloat)mr_h
{
    return self.frame.size.height;
}

- (void)setMr_size:(CGSize)mr_size
{
    CGRect frame = self.frame;
    frame.size = mr_size;
    self.frame = frame;
}

- (CGSize)mr_size
{
    return self.frame.size;
}

- (void)setMr_origin:(CGPoint)mr_origin
{
    CGRect frame = self.frame;
    frame.origin = mr_origin;
    self.frame = frame;
}

- (CGPoint)mr_origin
{
    return self.frame.origin;
}


@end
