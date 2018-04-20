//
//  SwipeViewController.m
//  TabBarApp
//
//  Created by Brian Vo on 2018-04-19.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic) UIView *whiteView;
@property (nonatomic) CGRect frame;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat height = 50;
    
    self.frame = CGRectMake(self.view.frame.origin.x,
                              CGRectGetMidY(self.view.bounds),
                              self.view.frame.size.width,
                              height);
    
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
    
    self.whiteView = [[UIView alloc] initWithFrame:self.frame];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.whiteView];
    [self.view bringSubviewToFront:self.whiteView];
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.whiteView addGestureRecognizer:swipeLeftGesture];
    
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.whiteView addGestureRecognizer:swipeRightGesture];
}

-(void)viewSwiped:(UISwipeGestureRecognizer *)sender {
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionRight: {
            [UIView animateWithDuration:0.5 animations:^{
                self.whiteView.frame = self.frame;
            }];
            break;
        }
        case UISwipeGestureRecognizerDirectionLeft: {
            [UIView animateWithDuration:0.5 animations:^{
                self.whiteView.frame = CGRectMake(self.view.frame.origin.x, CGRectGetMidY(self.view.bounds), self.view.frame.size.width - 100, 50);
            }];
            break;
        }
        default:
            break;
    }
//    switch (sender.state) {
//        case UIGestureRecognizerStateEnded: {
//            [UIView animateWithDuration:0.5 animations:^{
//                self.whiteView.frame = CGRectMake(self.view.frame.origin.x, CGRectGetMidY(self.view.bounds), self.view.frame.size.width - 100, 50);
//            }];
//            break;
//        }
//        default:
//            break;
//    }
}

@end
