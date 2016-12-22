//
//  CollectionMoveLayout.m
//  MyApp
//
//  Created by GJ on 2016/9/24.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "CollectionMoveLayout.h"

@interface CollectionMoveLayout()<UIGestureRecognizerDelegate>

@property (nonatomic, strong)UILongPressGestureRecognizer* longPress;
@property (nonatomic, strong)NSIndexPath* currentIndexPath;
@property (nonatomic, strong)UIView* mappingImageCell;

@end

@implementation CollectionMoveLayout

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureObserver];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"collectionView"];
}

- (void)configureObserver
{
    [self addObserver:self forKeyPath:@"collectionView" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setUpGestureRecognizers
{
    if (self.collectionView == nil) {
        return;
    }
    self.longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    _longPress.minimumPressDuration = 0.2f;
    _longPress.delegate = self;
    [self.collectionView addGestureRecognizer:_longPress];
}

#pragma mark - observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"collectionView"]) {
        [self setUpGestureRecognizers];
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)handleLongPress:(UILongPressGestureRecognizer*)longPress
{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint location = [longPress locationInView:self.collectionView];
            NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:location];
            if (!indexPath) {
                return;
            }
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint location = [longPress locationInView:self.collectionView];
            NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:location];
            if (!indexPath) {
                return;
            }
            [self.collectionView updateInteractiveMovementTargetPosition:location];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self.collectionView endInteractiveMovement];
        }
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

@end
