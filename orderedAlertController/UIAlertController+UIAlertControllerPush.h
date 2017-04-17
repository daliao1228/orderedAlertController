//
//  UIAlertController+UIAlertControllerPush.h
//  orderedAlertController
//
//  Created by lsy on 2017/4/17.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DismissCompletionBlock)();

@interface UIAlertController (UIAlertControllerPush)

@property (copy, nonatomic) DismissCompletionBlock block;

@end
