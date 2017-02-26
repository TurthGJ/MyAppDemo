//
//  MyHeaderView.m
//  MyApp
//
//  Created by GJ on 16/8/10.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "MyHeaderView.h"
#import "CommonDefine.h"
#import "UIScrollView+Extension.h"
#import "UIView+Extension.h"

@implementation MyHeaderView

+ (instancetype)initHeaderView:(id)target action:(SEL)action
{
    MyHeaderView* cmp = [[self alloc] init];
    cmp.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 50);
    cmp.backgroundColor = [UIColor redColor];
    [cmp setHeaderViewTargetAndAction:target action:action];
    return cmp;
}

- (void)scrollViewContentOffSet:(NSDictionary *)change
{
    [super scrollViewRefreshStateChange:change];
    
    if(self.refreshState == RefreshStateChanging)
        return;
    
    if (self.refreshState == RefreshStateWillChange)
    {
        UIEdgeInsets inset = self.scrollView.contentInset;
        inset.top = 100;
        self.scrollView.contentInset = inset;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                UIEdgeInsets inset = self.scrollView.contentInset;
                inset.top = 0;
                self.scrollView.contentInset = inset;
            }];
        });
    }
}

- (void)setRefreshState:(RefreshState)refreshState
{
    RefreshState oldState = self.refreshState;
    if (refreshState == oldState) return;
    [super setRefreshState:refreshState];
    
    if (refreshState == RefreshStateIdle) {
        if (oldState == RefreshStateChanging) {
            return;
        }
        [UIView animateWithDuration:0.4f animations:^{
            self.scrollView.mr_insetT -= self.mr_h;
        }];
    }
    else if(refreshState == RefreshStateChanging)
    {
        [UIView animateWithDuration:0.25f animations:^{
            self.scrollView.mr_insetT += self.mr_h;
        } completion:^(BOOL finished) {
            [self executeRefreshingCallback];
        }];
    }
}

@end
