//
//  DingDingAnimation.h
//  MyApp
//
//  Created by GJ on 16/8/23.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ExpansionDirection) {
    DirectionLeft = 0,
    DirectionRight,
    DirectionUp,
    DirectionDown
};

@interface DingDingAnimation : UIView<UIGestureRecognizerDelegate>

@property (nonatomic, assign) ExpansionDirection direction;

@property (nonatomic, strong) UIView *homeButtonView;

@property (nonatomic) float animationDuration;

// The spacing between menu buttons when expanded
@property (nonatomic) float buttonSpacing;

// The default alpha of the homeButtonView when not tapped
@property (nonatomic) float standbyAlpha;

// The highlighted alpha of the homeButtonView when tapped
@property (nonatomic) float highlightAlpha;

@property (nonatomic, assign)BOOL isCollapsed;

- (instancetype)initWithFrame:(CGRect)frame expansionDirection:(ExpansionDirection)direction;

- (void)addButtons:(NSArray*)buttons;

@end
