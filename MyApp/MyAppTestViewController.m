//
//  MyAppTestViewController.m
//  MyApp
//
//  Created by GJ on 16/8/24.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "MyAppTestViewController.h"
#import "DingDingAnimation.h"
#import "FromCollectionViewController.h"

@interface MyAppTestViewController()<UICollisionBehaviorDelegate>

@property (nonatomic,strong)UIDynamicAnimator* animator;
@property (nonatomic,strong)UIButton* btn;
@property (nonatomic,strong)UIView* aview;
@property (nonatomic,strong)UIAttachmentBehavior* attachmentBehavior;
@property (nonatomic,strong)UIPanGestureRecognizer* gesture;

@end

@implementation MyAppTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"test";
    
    _aview = [[UIView alloc]initWithFrame:CGRectMake(100, 50, 100, 100)];
    _aview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_aview];
    
//    _aview.transform = CGAffineTransformRotate(_aview.transform, 45);

    UIDynamicAnimator* animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[_aview]];
    [animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[_aview]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;
    
//    UISnapBehavior* snapBehavior = [[UISnapBehavior alloc]initWithItem:aview snapToPoint:CGPointMake(100, 500)];
//    snapBehavior.damping = 0.5;
//    [animator addBehavior:snapBehavior];
    
    self.animator = animator;
    
    UIPanGestureRecognizer* gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureHandle:)];
//    self.gesture = gesture;
    [self.aview addGestureRecognizer:gesture];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UILabel *homeLabel = [self createHomeButtonView];
    
    DingDingAnimation* upMenuView = [[DingDingAnimation alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f,
                                                                                        self.view.frame.size.height - homeLabel.frame.size.height - 20.f,
                                                                                        homeLabel.frame.size.width,
                                                                                        homeLabel.frame.size.height)
                                                          expansionDirection:DirectionUp];
    
    upMenuView.homeButtonView = homeLabel;
    [upMenuView addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:upMenuView];
    
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    _btn.titleLabel.text = @"test";
    _btn.backgroundColor = [UIColor redColor];
    [_btn addTarget:self action:@selector(actionBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}

- (void)gestureHandle:(UIPanGestureRecognizer*)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    NSLog(@"%f %f",translation.x, translation.y);
    if (gesture.state == UIGestureRecognizerStateBegan){
        
        CGPoint squareCenterPoint = CGPointMake(self.aview.center.x, self.aview.center.y - 100.0);
        
        UIAttachmentBehavior* attachmentBehavior = [[UIAttachmentBehavior alloc]initWithItem:self.aview offsetFromCenter:UIOffsetMake(-25.0, -25.0) attachedToAnchor:squareCenterPoint];
        
        self.attachmentBehavior = attachmentBehavior;
        [self.animator addBehavior:attachmentBehavior];
        
    } else if ( gesture.state == UIGestureRecognizerStateChanged) {
        
        [self.attachmentBehavior setAnchorPoint:[gesture locationInView:self.view]];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.attachmentBehavior];
    }
}

- (void)actionBtn
{
    FromCollectionViewController* vc = [[FromCollectionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
//    UILocalNotification* notifice = [[UILocalNotification alloc]init];
//    notifice.fireDate = [NSDate dateWithTimeIntervalSinceNow:8.0];
//    notifice.alertBody = @"在干嘛？";
//    notifice.alertAction = @"解锁";
//    notifice.hasAction = YES;
//    notifice.alertLaunchImage = @"zrx4.jpg";
//    notifice.alertTitle = @"您有一条新的信息";
//    notifice.soundName = @"回响.mp3";
//    notifice.applicationIconBadgeNumber = 1;
//    [[UIApplication sharedApplication]scheduleLocalNotification:notifice];
    
//    CAKeyframeAnimation* shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    shackAnimation.duration = 0.3f;
//    shackAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(self.aview.frame.origin.x - 10, self.aview.frame.origin.y)],
//                              [NSValue valueWithCGPoint:CGPointMake(self.aview.frame.origin.x + 10, self.aview.frame.origin.y)],
//                              [NSValue valueWithCGPoint:CGPointMake(self.aview.frame.origin.x - 10, self.aview.frame.origin.y)],
//                              [NSValue valueWithCGPoint:CGPointMake(self.aview.frame.origin.x + 10, self.aview.frame.origin.y)]];
//    shackAnimation.keyTimes = @[@0.25,@0.25,@0.25,@0.25];
//    shackAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [self.aview.layer addAnimation:shackAnimation forKey:nil];
    
//    CGPoint posLbl = [_btn.layer position];
//    CGPoint y = CGPointMake(posLbl.x-10, posLbl.y);
//    CGPoint x = CGPointMake(posLbl.x+10, posLbl.y);
//    
//    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    [animation setTimingFunction:[CAMediaTimingFunction
//                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [animation setFromValue:[NSValue valueWithCGPoint:x]];
//    [animation setToValue:[NSValue valueWithCGPoint:y]];
//    [animation setAutoreverses:YES];
//    [animation setDuration:0.08];
//    [animation setRepeatCount:3];
//    
//    [self.btn.layer addAnimation:animation forKey:nil];
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A", @"B",@"C",@"D",@"E",@"F"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(dwBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    
    return [buttonsMutable copy];
}

- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"Tap";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    label.clipsToBounds = YES;
    
    return label;
}

- (void)dwBtnClick:(UIButton *)sender {
    NSLog(@"DWButton tapped, tag: %ld", (long)sender.tag);
}

@end
