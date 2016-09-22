//
//  AnoViewController.h
//  转场动画自定义
//
//  Created by 杨森林 on 16/9/19.
//  Copyright © 2016年 ZhongHuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AnoViewController;
@protocol AnoViewControllerDelegate<NSObject>
- (void)AnoViewControllerDidClickedDissmissButton:(AnoViewController *)ViewController;
@end
@interface AnoViewController : UIViewController
@property (nonatomic, weak) id<AnoViewControllerDelegate> delegate;
@end
