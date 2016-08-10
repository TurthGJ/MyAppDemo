//
//  MyViewComponent.m
//  MyApp
//
//  Created by GJ on 16/8/10.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "MyViewComponent.h"

NSString *const RefreshKeyPathContentOffset = @"contentOffset";
NSString *const RefreshKeyPathContentInset = @"contentInset";

@interface MyViewComponent()

@property (nonatomic, strong)UIScrollView* scrollView;

@end

@implementation MyViewComponent

- (instancetype)init
{
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    // 如果不是UIScrollView，不做任何事情
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) return;
    
    // 旧的父控件移除监听
    [self removeObservers];
    
    if (newSuperview)
    {
        self.scrollView = (UIScrollView*)newSuperview;
        self.scrollView.alwaysBounceVertical = YES;
    }
    [self addObservers];
}

- (void)addObservers
{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentInset options:options context:nil];
}


- (void)removeObservers
{
    [self.scrollView removeObserver:self forKeyPath:RefreshKeyPathContentInset];
    [self.scrollView removeObserver:self forKeyPath:RefreshKeyPathContentOffset];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString: RefreshKeyPathContentOffset]) {
        NSLog(@"offset");
        NSLog(@"new = %@",[change objectForKey:@"new"]);
        CGFloat offset = [[change objectForKey:@"new"] CGPointValue].y;
        if (-100 > offset) {
            UIEdgeInsets inset = self.scrollView.contentInset;
            inset.top = 100;
            self.scrollView.contentInset = inset;
        }
    }
    else if([keyPath isEqualToString: RefreshKeyPathContentInset])
    {
        NSLog(@"inset");
        NSLog(@"new = %@",[change objectForKey:@"new"]);
        
    }
}

@end
