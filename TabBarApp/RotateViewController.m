//
//  RotateViewController.m
//  TabBarApp
//
//  Created by Brian Vo on 2018-04-19.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2,
                              CGRectGetMidY(self.view.bounds) - height/2,
                              width,
                              height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(viewRotate:)];
    
    [view addGestureRecognizer:rotateGesture];
}

- (void)viewRotate:(UIRotationGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    
    sender.rotation = 0;
}

@end
