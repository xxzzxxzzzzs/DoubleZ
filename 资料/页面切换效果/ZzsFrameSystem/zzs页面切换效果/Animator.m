//
//  Animator.m
//  NavigationTransitionTest
//
//  Created by Chris Eidhof on 9/27/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "Animator.h"

@implementation Animator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
      toViewController.view.backgroundColor=[UIColor redColor];
    fromViewController.view.backgroundColor=[UIColor yellowColor];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        fromViewController.navigationController.navigationBar.frame=CGRectMake(0, 0, 500, 0);
        toViewController.view.frame=CGRectMake(0, 1000, 500, 0);
       
    } completion:^(BOOL finished) {
                [UIView animateWithDuration:1 animations:^{
               toViewController.navigationController.navigationBar.frame=CGRectMake(0, 0, 500, 64);
             toViewController.view.alpha = 1;
            toViewController.view.frame=CGRectMake(0, 0, 320, 480);
         
                    fromViewController.view.transform = CGAffineTransformIdentity;
              [transitionContext completeTransition:![transitionContext transitionWasCancelled]];        
 
        }];
      
        
    }];
}

@end
