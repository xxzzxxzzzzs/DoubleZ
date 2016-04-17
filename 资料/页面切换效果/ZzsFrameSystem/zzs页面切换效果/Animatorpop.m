//
//  Animator.m
//  NavigationTransitionTest
//
//  Created by Chris Eidhof on 9/27/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "Animatorpop.h"

@implementation Animatorpop

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        fromViewController.navigationController.navigationBar.frame=CGRectMake(0, 0, 500, 0);
        toViewController.view.frame=CGRectMake(0, 1000, 500, 0);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
     
        [UIView animateWithDuration:1 animations:^{
            toViewController.navigationController.navigationBar.frame=CGRectMake(0, 0, 500, 64);
            toViewController.view.backgroundColor=[UIColor redColor];
            toViewController.view.frame=CGRectMake(0, 0, 320, 480);
            
            
        }];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
