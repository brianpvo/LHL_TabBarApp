//
//  PanViewController.m
//  TabBarApp
//
//  Created by Brian Vo on 2018-04-19.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)redViewPan:(UIPanGestureRecognizer *)sender {
    
//    CGPoint locationInView = [sender locationInView:self.view];
//
//    sender.view.center = locationInView;
    
    CGPoint translationView = [sender translationInView:self.view];
                               
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationView.x, oldCenter.y + translationView.y);
    
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
                    
}

@end
