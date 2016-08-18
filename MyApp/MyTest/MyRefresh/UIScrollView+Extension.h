//
//  UIScrollView+Extension.h
//  MyApp
//
//  Created by GJ on 16/8/15.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extension)

@property (assign, nonatomic) CGFloat mr_insetT;
@property (assign, nonatomic) CGFloat mr_insetB;
@property (assign, nonatomic) CGFloat mr_insetL;
@property (assign, nonatomic) CGFloat mr_insetR;

@property (assign, nonatomic) CGFloat mr_offsetX;
@property (assign, nonatomic) CGFloat mr_offsetY;

@property (assign, nonatomic) CGFloat mr_contentW;
@property (assign, nonatomic) CGFloat mr_contentH;

@end
