//
//  DingDingAnimation.m
//  MyApp
//
//  Created by GJ on 16/8/23.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "DingDingAnimation.h"

@interface DingDingAnimation()

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) NSMutableArray *buttonContainer;
@property (nonatomic, assign) CGRect originFrame;

@end

@implementation DingDingAnimation

- (instancetype)initWithFrame:(CGRect)frame expansionDirection:(ExpansionDirection)direction {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self _defaultInit];
        _direction = direction;
    }
    return self;
}

- (void)_defaultInit
{
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    self.direction = DirectionUp;
    self.buttonSpacing = 20.0f;
    self.originFrame = self.frame;
    self.isCollapsed = YES;
    self.animationDuration = 0.25f;
    self.highlightAlpha = 0.45f;
    self.standbyAlpha = 1.0f;
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_handleTapGesture:)];
    self.tapGestureRecognizer.cancelsTouchesInView = NO;
    self.tapGestureRecognizer.delegate = self;
    
    [self addGestureRecognizer:self.tapGestureRecognizer];
}


- (void)_handleTapGesture:(id)sender
{
    if (self.tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint touchLocation = [self.tapGestureRecognizer locationOfTouch:0 inView:self];
        
        if (CGRectContainsPoint(self.homeButtonView.frame, touchLocation) == false) {
            [self dismissButtons];
        }
    }
}

- (void)showButtons
{
    
    [self extendFrame];
    self.userInteractionEnabled = NO;
    [CATransaction begin];
    [CATransaction setAnimationDuration:_animationDuration];
    [CATransaction setCompletionBlock:^(){
        
        for (UIButton *button in _buttonContainer) {
            button.transform = CGAffineTransformIdentity;
        }
        self.userInteractionEnabled = YES;
        
    }];
    for(int i = 0; i < _buttonContainer.count; i++)
    {
        int index = (int)_buttonContainer.count - (i + 1);
        UIButton* button = [_buttonContainer objectAtIndex:i];
        button.hidden = NO;
        
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        CGPoint originPosition = CGPointZero;
        CGPoint finalPoint = CGPointZero;
        
        switch (_direction) {
            case DirectionLeft: {
                
                break;
            }
            case DirectionRight: {
                
                break;
            }
            case DirectionUp: {
                originPosition = CGPointMake(self.frame.size.width/2.f, self.frame.size.height - self.homeButtonView.frame.size.height);
                finalPoint = CGPointMake(self.frame.size.width/2.f,
                                            self.frame.size.height - self.homeButtonView.frame.size.height - self.buttonSpacing - button.frame.size.height/2.f
                                            - ((button.frame.size.height + self.buttonSpacing) * index));
                NSLog(@"%f %f",finalPoint.x,finalPoint.y);
                break;
            }
            case DirectionDown: {
                
                break;
            }
        }
        
        positionAnimation.duration = _animationDuration;
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:originPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:finalPoint];
        positionAnimation.beginTime = CACurrentMediaTime() + (_animationDuration/(float)_buttonContainer.count * (float)i);
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        
        [button.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        button.layer.position = finalPoint;
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration = _animationDuration;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scaleAnimation.fromValue = [NSNumber numberWithFloat:0.01f];
        scaleAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        scaleAnimation.beginTime = CACurrentMediaTime() + (_animationDuration/(float)_buttonContainer.count * (float)i) + 0.03f;
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.removedOnCompletion = NO;
        
        [button.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
        button.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
        
        [CATransaction commit];
    }
    self.isCollapsed = NO;
}


- (void)dismissButtons
{
    self.userInteractionEnabled = NO;
    [CATransaction begin];
    [CATransaction setAnimationDuration:_animationDuration];
    [CATransaction setCompletionBlock:^(){
        [self _finishCollapse];
        for (UIButton *button in _buttonContainer) {
            button.transform = CGAffineTransformIdentity;
            button.hidden = YES;
        }
        self.userInteractionEnabled = YES;
        
    }];
    int index = 0;
    for(int i = (int)_buttonContainer.count - 1; i >= 0 ; i--)
    {
        UIButton* button = [_buttonContainer objectAtIndex:i];
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration = _animationDuration;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.f];
        scaleAnimation.toValue = [NSNumber numberWithFloat:0.01f];
        scaleAnimation.beginTime = CACurrentMediaTime() + (_animationDuration/(float)_buttonContainer.count * (float)index) + 0.03f;
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.removedOnCompletion = NO;
        
        [button.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
        button.transform = CGAffineTransformMakeScale(1.f, 1.f);
        
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        CGPoint originPosition = button.layer.position;
        CGPoint finalPoint = CGPointZero;
        
        switch (_direction) {
            case DirectionLeft: {
                
                break;
            }
            case DirectionRight: {
                
                break;
            }
            case DirectionUp: {
                finalPoint = CGPointMake(self.frame.size.width/2.f, self.frame.size.height - self.homeButtonView.frame.size.height);
                break;
            }
            case DirectionDown: {
                
                break;
            }
        }
        
        positionAnimation.duration = _animationDuration;
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:originPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:finalPoint];
        positionAnimation.beginTime = CACurrentMediaTime() + _animationDuration/(float)_buttonContainer.count * (float)index;
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        
        [button.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        button.layer.position = originPosition;
        index++;
        
        [CATransaction commit];
    }
    self.isCollapsed = YES;
}

- (void)addButtons:(NSArray*)buttons
{
    for(UIButton* button in buttons)
    {
        [self addButton:button];
    }
    if (self.homeButtonView != nil) {
        [self bringSubviewToFront:self.homeButtonView];
    }
}

- (void)addButton:(UIButton *)button {
    if (_buttonContainer == nil) {
        self.buttonContainer = [[NSMutableArray alloc] init];
    }
    
    if ([_buttonContainer containsObject:button] == false) {
        [_buttonContainer addObject:button];
        [self addSubview:button];
        button.hidden = YES;
    }
}

- (void)setHomeButtonView:(UIView *)homeButtonView {
    if (_homeButtonView != homeButtonView) {
        _homeButtonView = homeButtonView;
    }
    
    if ([_homeButtonView isDescendantOfView:self] == NO) {
        [self addSubview:_homeButtonView];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    if (CGRectContainsPoint(self.homeButtonView.frame, [touch locationInView:self])) {
        [self _setTouchHighlighted:YES];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    [self _setTouchHighlighted:NO];
    
    if (CGRectContainsPoint(self.homeButtonView.frame, [touch locationInView:self])) {
        if (_isCollapsed) {
            [self showButtons];
        } else {
            [self dismissButtons];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    [self _setTouchHighlighted:NO];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    [self _setTouchHighlighted:CGRectContainsPoint(self.homeButtonView.frame, [touch locationInView:self])];
}

- (void)_animateWithBlock:(void (^)(void))animationBlock {
    [UIView transitionWithView:self
                      duration:0.25f
                       options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
                    animations:animationBlock
                    completion:NULL];
}

- (void)_setTouchHighlighted:(BOOL)highlighted {
    float alphaValue = highlighted ? _highlightAlpha : _standbyAlpha;
    
//    if (self.homeButtonView.alpha == alphaValue)
//        return;
//    
//    if (_animatedHighlighting) {
//        [self _animateWithBlock:^{
//            if (self.homeButtonView != nil) {
//                self.homeButtonView.alpha = alphaValue;
//            }
//        }];
//    } else {
//        if (self.homeButtonView != nil) {
//            self.homeButtonView.alpha = alphaValue;
//        }
//    }
}

- (CGFloat)verticalHeight
{
    CGFloat height = 0;
    for (UIButton *button in _buttonContainer) {
        height += button.frame.size.height + self.buttonSpacing;
    }
    return height;
}

- (CGFloat)horizontalWidth
{
    CGFloat width = 0;
    for (UIButton *button in _buttonContainer) {
        width += button.frame.size.width + self.buttonSpacing;
    }
    return width;
}

- (void)_finishCollapse {
    self.frame = _originFrame;
}

- (void)extendFrame
{
    float buttonHeight = [self verticalHeight];
    float buttonWidth = [self horizontalWidth];
    switch (self.direction) {
        case DirectionLeft: {
            
            break;
        }
        case DirectionRight: {
           
            break;
        }
        case DirectionUp: {
            
            self.homeButtonView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动调整与superView顶部的距离，保证与superView底部的距离不变。
            
            CGRect frame = self.frame;
            frame.origin.y -= buttonHeight;
            frame.size.height += buttonHeight;
            self.frame = frame;
        }
            break;
        case DirectionDown: {
         
            break;
        }
    }
}

@end
