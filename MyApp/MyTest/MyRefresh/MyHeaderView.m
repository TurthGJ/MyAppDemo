//
//  MyHeaderView.m
//  MyApp
//
//  Created by GJ on 16/8/10.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "MyHeaderView.h"
#import "CommonDefine.h"

@implementation MyHeaderView

+ (instancetype)initHeaderView
{
    MyHeaderView* cmp = [[self alloc] init];
    cmp.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 50);
    cmp.backgroundColor = [UIColor redColor];
    return cmp;
}

@end
