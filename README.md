# Customtrisiton
新建一个类去实现任意的自定义转场效果。
遵守UIViewControllerAnimatedTransitioning 协议
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}
// 持续时间
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
最后在要转场的ViewControoler,遵守UIViewControllerTransitioningDelegate 协议
实现present动画
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}
还有其他类似的
-(id< UIViewControllerAnimatedTransitioning >)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;

-(id< UIViewControllerAnimatedTransitioning >)animationControllerForDismissedController:(UIViewController *)dismissed;

-(id< UIViewControllerInteractiveTransitioning >)interactionControllerForPresentation:(id < UIViewControllerAnimatedTransitioning >)animator;

-(id< UIViewControllerInteractiveTransitioning >)interactionControllerForDismissal:(id < UIViewControllerAnimatedTransitioning >)animator;
前两个方法是针对动画切换的，我们需要分别在呈现VC和解散VC时，给出一个实现了UIViewControllerAnimatedTransitioning接口的对象（其中包含切换时长和如何切换）。后两个方法涉及交互式切换
