//
//  EdgeViewController.m
//  TabBarApp
//
//  Created by Brian Vo on 2018-04-19.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *swipeView;
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *edgeRightPanGesture;
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *edgeLeftPanGesture;
@property (nonatomic) CGRect originalFrame;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalFrame = self.swipeView.frame;
    self.edgeRightPanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeEdge:)];
    self.edgeRightPanGesture.delegate = self;
    self.edgeRightPanGesture.edges = UIRectEdgeRight;
    
    self.edgeLeftPanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeftEdge:)];
    self.edgeLeftPanGesture.delegate = self;
    self.edgeLeftPanGesture.edges = UIRectEdgeLeft;

    [self.swipeView addGestureRecognizer:self.edgeRightPanGesture];
    [self.view addGestureRecognizer:self.edgeLeftPanGesture];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

-(void)didSwipeLeftEdge:(UIScreenEdgePanGestureRecognizer *)sender {
    [UIView animateWithDuration:1 animations:^{
        self.swipeView.frame = self.originalFrame;
    }];
}

- (void)didSwipeEdge:(UIScreenEdgePanGestureRecognizer *)sender {
    CGRect frame = CGRectMake(self.originalFrame.origin.x - 100,
                              self.originalFrame.origin.y,
                              self.originalFrame.size.width,
                              self.originalFrame.size.height);
    [UIView animateWithDuration:1 animations:^{
        self.swipeView.frame = frame;
    }];
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures {
    return UIRectEdgeRight;
}

@end
