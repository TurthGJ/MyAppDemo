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

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemTableView.delegate = self;
    self.itemTableView.dataSource = self;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.itemTableView.headView = [MyHeaderView initHeaderView:self action:@selector(loadData)];
//
    
    NSString* path = @"http://s18.postimg.org/riusuxiix/Nsdata.jpg";
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
    
    NSString* type = [CommonFunction contentTypeForImageData:data];
    
    
    UILabel* label = [[UILabel alloc]init];
    label.text = @"refresh";
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 50);
    
    [self.itemTableView.headView addSubview:label];
}

- (void)loadData
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    cell.textLabel.text = @"test";
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
