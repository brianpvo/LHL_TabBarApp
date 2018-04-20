//
//  SwipeViewController.m
//  TabBarApp
//
//  Created by Brian Vo on 2018-04-19.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(self.view.frame.origin.x,
                              CGRectGetMidY(self.view.bounds),
                              self.view.frame.size.width,
                              height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
    
    UIView *subView = [[UIView alloc] initWithFrame:frame];
    subView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:subView];
    [self.view bringSubviewToFront:subView];
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [subView addGestureRecognizer:swipeGesture];
}

-(void)viewSwiped:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipe");
}

@end
