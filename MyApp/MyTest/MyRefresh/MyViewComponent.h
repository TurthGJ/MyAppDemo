//
//  MyViewComponent.h
//  MyApp
//
//  Created by GJ on 16/8/10.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyRefreshConst.h"

@interface MyViewComponent : UIView

typedef void (^MyRefreshComponentRefreshingBlock)();

@property (nonatomic, assign) RefreshState refreshState;
@property (nonatomic, weak)id refreshTarget;
@property (nonatomic, assign) SEL refreshAction;
@property (nonatomic, weak, readonly) UIScrollView* scrollView;

- (void)executeRefreshingCallback;

@property (copy, nonatomic) MyRefreshComponentRefreshingBlock refreshingBlock;

- (void)scrollViewContentOffSet:(NSDictionary*)change;
- (void)scrollViewContentInset:(NSDictionary*)change;
- (void)scrollViewRefreshStateChange:(NSDictionary*)change;
- (void)setHeaderViewTargetAndAction:(id)target action:(SEL)action;

@end
