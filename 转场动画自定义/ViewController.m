//
//  ViewController.m
//  转场动画自定义
//
//  Created by 杨森林 on 16/9/19.
//  Copyright © 2016年 ZhongHuan. All rights reserved.
//

#import "ViewController.h"
#import "BouncePresentAnimation.h"
#import "AnoViewController.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong)BouncePresentAnimation * presentAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _presentAnimation = [BouncePresentAnimation new];
   

}


- (IBAction)turn:(id)sender {
    AnoViewController * anoVC = [[AnoViewController alloc] init];
   anoVC.delegate = self;
    [self presentViewController:anoVC animated:YES completion:nil];
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}
- (void)AnoViewControllerDidClickedDissmissButton:(AnoViewController *)ViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
