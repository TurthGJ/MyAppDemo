//
//  MyViewComponent.m
//  MyApp
//
//  Created by GJ on 16/8/10.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "MyViewComponent.h"
#import "CommonDefine.h"
#import <objc/message.h>

#define MJRefreshMsgTarget(target) (__bridge void*)(target)
#define MJRefreshMsgSend(...) ((void (*)(void *, SEL, UIView *))objc_msgSend)(__VA_ARGS__)

NSString *const RefreshKeyPathContentOffset = @"contentOffset";
NSString *const RefreshKeyPathContentInset = @"contentInset";
NSString *const RefreshKeyPathState = @"refreshState";

@interface MyViewComponent()
{
    __weak UIScrollView* _scrollView;
}

@property (nonatomic, strong)UIPanGestureRecognizer* pan;

@end

@implementation MyViewComponent

- (instancetype)init
{
    self = [super init];
    if (self) {
        // add something
    }
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
        _scrollView = (UIScrollView*)newSuperview;
        _scrollView.alwaysBounceVertical = YES;
    }
    [self addObservers];
}


- (void)addObservers
{
    NSLog(@"%s", __FUNCTION__);
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentInset options:options context:nil];
    self.pan = _scrollView.panGestureRecognizer;
    [self.pan addObserver:self forKeyPath:RefreshKeyPathState options:options context:nil];
}


- (void)removeObservers
{
    NSLog(@"%s", __FUNCTION__);
    [self.superview removeObserver:self forKeyPath:RefreshKeyPathContentInset];
    [self.superview removeObserver:self forKeyPath:RefreshKeyPathContentOffset];
    [self.pan removeObserver:self forKeyPath:RefreshKeyPathState];
    self.pan = nil;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString: RefreshKeyPathContentOffset]) {
        [self scrollViewContentOffSet:change];
        DLOG(@"offset");
//        NSLog(@"new = %@",[change objectForKey:@"new"]);
//        CGFloat offset = [[change objectForKey:@"new"] CGPointValue].y;
//        self.frame = CGRectMake(0, offset, MAIN_SCREEN_WIDTH, 100);
//        if (-100 > offset) {
//            
//        }
    }
    else if([keyPath isEqualToString: RefreshKeyPathContentInset])
    {
        DLOG(@"inset");
        DLOG(@"new = %@",[change objectForKey:@"new"]);
        [self scrollViewContentInset:change];
    }
    else if ([keyPath isEqualToString:RefreshKeyPathState])
    {
        DLOG(@"state");
        [self scrollViewRefreshStateChange:change];
    }
}

- (void)scrollViewContentInset:(NSDictionary *)change{}
- (void)scrollViewContentOffSet:(NSDictionary *)change{}
- (void)scrollViewRefreshStateChange:(NSDictionary *)change{}

- (void)setHeaderViewTargetAndAction:(id)target action:(SEL)action
{
    self.refreshTarget = target;
    self.refreshAction = action;
}

- (void)executeRefreshingCallback
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.refreshingBlock) {
            self.refreshingBlock();
        }
        if ([self.refreshTarget respondsToSelector:self.refreshAction]) {
            MJRefreshMsgSend(MJRefreshMsgTarget(self.refreshTarget), self.refreshAction, self);
        }
    });
}


@end
