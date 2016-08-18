//
//  UIScrollView+RefreshData.m
//  MyApp
//
//  Created by GJ on 16/7/25.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "UIScrollView+RefreshData.h"
#import <objc/runtime.h>
#import "CommonDefine.h"

@implementation UIScrollView (RefreshData)
static const char RefreshHeaderKey = '\0';
static const char RefreshFooterKey = '\0';


- (void)setHeadView:(MyHeaderView *)headView
{
    if (headView != self.headView) {
        [self.headView removeFromSuperview];
        
        [self insertSubview:headView atIndex:0];
        
        objc_setAssociatedObject(self, &RefreshHeaderKey, headView, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (MyHeaderView*)headView
{
    return objc_getAssociatedObject(self, &RefreshHeaderKey);
}

- (void)setFootView:(MyHeaderView *)footView
{
    if (footView != self.footView) {
        [self.footView removeFromSuperview];
        objc_setAssociatedObject(self, &RefreshFooterKey, footView, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (UIView*)footView
{
    return objc_getAssociatedObject(self, &RefreshFooterKey);
}


@end
