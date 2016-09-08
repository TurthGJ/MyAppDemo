//
//  ToViewController.m
//  MyApp
//
//  Created by GJ on 16/9/1.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "ToViewController.h"
#import "PhotoViewTransitionHelper.h"
#import "CommonDefine.h"
#import "SwipeUpInteractiveTransition.h"

@interface ToViewController ()

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"神奇移动";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zrx4.jpg"]];
    self.imageView = imageView;
    imageView.frame = CGRectMake(MAIN_SCREEN_WIDTH/2 - 150, 100, 300, 300);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [PhotoViewTransitionHelper transitionWithType:operation == UINavigationControllerOperationPush?transitionTypePush:transitionTypePop];
}



@end
