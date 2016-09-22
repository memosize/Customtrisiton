//
//  BouncePresentAnimation.m
//  转场动画自定义
//
//  Created by 杨森林 on 16/9/22.
//  Copyright © 2016年 ZhongHuan. All rights reserved.
//

#import "BouncePresentAnimation.h"
#import "AnoViewController.h"
@implementation BouncePresentAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}
// set animation durtion
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //1,get controllers from trisition context
    AnoViewController * anoVC = [transitionContext viewControllerForKey:UITransitionContextToViewKey];
    //2, set init frame for toVC
    CGRect screenbounds = [UIScreen mainScreen].bounds;
    CGRect finalbounds = [transitionContext finalFrameForViewController:anoVC];
    anoVC.view.frame = CGRectOffset(finalbounds, 0, screenbounds.size.height);
    //3, add anoVC"s view to containerview
    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:anoVC.view];
    // 4, do animate
    NSTimeInterval durtion = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:durtion
                          delay:0.0
                          usingSpringWithDamping:0.6
                          initialSpringVelocity:0.0
                          options:UIViewAnimationOptionCurveLinear animations:^{
                              anoVC.view.frame = finalbounds;
                          } completion:^(BOOL finished) {
                              [transitionContext completeTransition:YES];
                          }];
    
    
}
@end
