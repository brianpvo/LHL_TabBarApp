//
//  TapViewController.m
//  TabBarApp
//
//  Created by Brian Vo on 2018-04-19.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "TapViewController.h"

@implementation TapViewController

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
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    [view addGestureRecognizer:tapGesture];
}

-(void)viewTapped:(UITapGestureRecognizer *)sender {
    UIColor *purpleColor = [UIColor purpleColor];
    // ternary expression
    UIColor *color = [sender.view.backgroundColor isEqual: purpleColor] ? [UIColor orangeColor] : [UIColor purpleColor];
    sender.view.backgroundColor = color;
}

@end
