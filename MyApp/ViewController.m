//
//  ViewController.m
//  MyApp
//
//  Created by GJ on 16/7/11.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "ViewController.h"
#import "Common/CommonDefine.h"
#import "Common/CommonFunction.h"
#import "UIScrollView+RefreshData.h"
#import "MyHeaderView.h"
#import "CollectionMoveLayout.h"

@interface ViewController ()<CollectionMoveDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView* myCollectionView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
        
    CollectionMoveLayout* layout = [[CollectionMoveLayout alloc]init];
    layout.delegate = self;
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing      = 10;
    layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
    layout.headerReferenceSize = CGSizeMake(MAIN_SCREEN_WIDTH, 40.f);
    //    layout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 0.f);
    //    [layout setSectionInset:UIEdgeInsetsMake(0, 0,20,0)];
    NSString* str = [@"abc" copy];
    NSArray* array = [NSArray arrayWithObject:str];
    [array autorelease];
    
    NSLog(@"%lu",(unsigned long)[str retainCount]);

    
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT) collectionViewLayout:layout];
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.backgroundColor = [UIColor whiteColor];
    [_myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _myCollectionView.allowsMultipleSelection = YES;
    [self.view addSubview:_myCollectionView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)loadData
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identify = @"cell";
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    if (cell.isSelected) {
        cell.backgroundColor = [UIColor blackColor];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}


- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"moveItemAtIndexPath");
}

@end
