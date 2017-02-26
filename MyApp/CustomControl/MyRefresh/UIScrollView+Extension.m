//
//  UIScrollView+Extension.m
//  MyApp
//
//  Created by GJ on 16/8/15.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "UIScrollView+Extension.h"

@implementation UIScrollView (Extension)

- (void)setMr_insetT:(CGFloat)mr_insetT
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = mr_insetT;
    self.contentInset = inset;
}

- (CGFloat)mr_insetT
{
    return self.contentInset.top;
}

- (void)setMr_insetB:(CGFloat)mr_insetB
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = mr_insetB;
    self.contentInset = inset;
}

- (CGFloat)mr_insetB
{
    return self.contentInset.bottom;
}

- (void)setMr_insetL:(CGFloat)mr_insetL
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = mr_insetL;
    self.contentInset = inset;
}

- (CGFloat)mr_insetL
{
    return self.contentInset.left;
}

- (void)setMr_insetR:(CGFloat)mr_insetR
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = mr_insetR;
    self.contentInset = inset;
}

- (CGFloat)mr_insetR
{
    return self.contentInset.right;
}

- (void)setMr_offsetX:(CGFloat)mr_offsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = mr_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)mr_offsetX
{
    return self.contentOffset.x;
}

- (void)setMr_offsetY:(CGFloat)mr_offsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = mr_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)mr_offsetY
{
    return self.contentOffset.y;
}

- (void)setMr_contentW:(CGFloat)mr_contentW
{
    CGSize size = self.contentSize;
    size.width = mr_contentW;
    self.contentSize = size;
}

- (CGFloat)mr_contentW
{
    return self.contentSize.width;
}

- (void)setMr_contentH:(CGFloat)mr_contentH
{
    CGSize size = self.contentSize;
    size.height = mr_contentH;
    self.contentSize = size;
}

- (CGFloat)mr_contentH
{
    return self.contentSize.height;
}

@end
