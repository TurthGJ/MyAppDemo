//
//  SwipeUpInteractiveTransition.h
//  MyApp
//
//  Created by GJ on 16/9/7.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign)BOOL interacting;

- (void)writeToViewController:(UIViewController*)viewController;

@end
