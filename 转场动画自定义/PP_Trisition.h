//
//  PP_Trisition.h
//  转场动画自定义
//
//  Created by 杨森林 on 16/9/19.
//  Copyright © 2016年 ZhongHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PP_Trisition : NSObject
// 定义一个枚举类
typedef NS_OPTIONS(NSUInteger, AnimatedScence)
{
    AnimatedScenePush = 0,         // 值为 0
    AnimatedScenePop = 1 << 0,     // 值为 2 的 0次
    AnimatedScenePresent = 1 << 1, // 值为 2 的 1次
    AnimatedSceneDissmiss = 1 << 2 // 值为 2 的 2次
};
- (instancetype)initWithStytle:()scene;
@end
