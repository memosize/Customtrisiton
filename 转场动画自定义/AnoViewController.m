//
//  AnoViewController.m
//  转场动画自定义
//
//  Created by 杨森林 on 16/9/19.
//  Copyright © 2016年 ZhongHuan. All rights reserved.
//

#import "AnoViewController.h"
#import "ViewController.h"
@interface AnoViewController ()

@end

@implementation AnoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) buttonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(AnoViewControllerDidClickedDissmissButton:)]) {
        [self.delegate AnoViewControllerDidClickedDissmissButton:self];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
