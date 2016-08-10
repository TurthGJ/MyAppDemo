//
//  UIScrollView+RefreshData.h
//  MyApp
//
//  Created by GJ on 16/7/25.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHeaderView.h"


@interface UIScrollView (RefreshData)

@property (nonatomic, strong) MyViewComponent* headView;
@property (nonatomic, strong) MyViewComponent* footView;

@end
