//
//  PhotoViewTransitionHelper.m
//  MyApp
//
//  Created by GJ on 16/8/31.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "PhotoViewTransitionHelper.h"
#import "ToViewController.h"
#import "FromCollectionViewController.h"
#import "FromCollectionViewCell.h"

@interface PhotoViewTransitionHelper()

@property (nonatomic, assign)transitionType type;

@end

@implementation PhotoViewTransitionHelper

+ (instancetype)transitionWithType:(transitionType)type{
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(transitionType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (CGFloat)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.75f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (_type) {
        case transitionTypePush: {
            [self doPushAnimation:transitionContext];
            break;
        }
        case transitionTypePop: {
            [self doPopAnimation:transitionContext];
            break;
        }
    }
}

- (void)doPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ToViewController* fromViewC = (ToViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FromCollectionViewController* toViewC = (FromCollectionViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    FromCollectionViewCell* cell = (FromCollectionViewCell*)[toViewC.collectionView cellForItemAtIndexPath:toViewC.indexPath];
    UIView* view = [transitionContext containerView];
    
    UIView* tempView = view.subviews.lastObject;
    
    cell.imageView.hidden = YES;
    fromViewC.imageView.hidden = YES;
    tempView.hidden = NO;
    
    [view insertSubview:toViewC.view atIndex:0];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.55 options:0 animations:^{
        tempView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:view];
        fromViewC.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        cell.imageView.hidden = NO;
        fromViewC.imageView.hidden = NO;
        [tempView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}


- (void)doPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    FromCollectionViewController* fromViewC = (FromCollectionViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ToViewController* toViewC = (ToViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    FromCollectionViewCell* cell = (FromCollectionViewCell*)[fromViewC.collectionView cellForItemAtIndexPath:fromViewC.indexPath];
    UIView* view = [transitionContext containerView];
    
    UIView* tempView = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    tempView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:view];
    
    cell.imageView.hidden = YES;
    toViewC.imageView.hidden = YES;
    toViewC.view.alpha = 0;
    
    [view addSubview:toViewC.view];
    [view addSubview:tempView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1/0.55 options:0 animations:^{
        tempView.frame = [toViewC.imageView convertRect:toViewC.imageView.bounds toView:view];
        toViewC.view.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toViewC.imageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];

}

@end
