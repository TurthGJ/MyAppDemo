//
//  PhotoViewTransitionHelper.h
//  MyApp
//
//  Created by GJ on 16/8/31.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

typedef NS_ENUM(NSUInteger, transitionType) {
    transitionTypePush = 0,
    transitionTypePop
};


@interface PhotoViewTransitionHelper : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(transitionType)type;

@end
