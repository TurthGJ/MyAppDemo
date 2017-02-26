//
//  MyRefreshConst.h
//  MyApp
//
//  Created by GJ on 16/8/11.
//  Copyright © 2016年 GJ. All rights reserved.
//

#ifndef MyRefreshConst_h
#define MyRefreshConst_h
#import <UIKIT/UIkit.h>

//const CGFloat MyHeaderViewHeight = 54.0;
//const CGFloat MyFooterViewHeight = 54.0;

typedef enum : NSUInteger {
    RefreshStateIdle,
    RefreshStateWillChange,
    RefreshStateChanging,
    RefreshStateDidChange
} RefreshState;


#endif /* MyRefreshConst_h */
