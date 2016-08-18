//
//  MyHeaderView.h
//  MyApp
//
//  Created by GJ on 16/8/10.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewComponent.h"
#import "MyRefreshConst.h"

@interface MyHeaderView : MyViewComponent

//@property (nonatomic, retain)UILabel* textLab;

+ (instancetype)initHeaderView:(id)target action:(SEL)action;

@end
