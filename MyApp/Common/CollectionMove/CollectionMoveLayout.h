//
//  CollectionMoveLayout.h
//  MyApp
//
//  Created by GJ on 2016/9/24.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionMoveDelegate <NSObject>

- (void)moveDataItem:(NSIndexPath*)fromIndexPath toIndexPath:(NSIndexPath*)toIndexPath;

@end

@interface CollectionMoveLayout : UICollectionViewFlowLayout

@property (nonatomic,weak)id<CollectionMoveDelegate>delegate;

@end
