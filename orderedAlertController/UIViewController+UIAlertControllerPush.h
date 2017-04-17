//
//  UIViewController+UIAlertControllerPush.h
//  orderedAlertController
//
//  Created by lsy on 2017/4/17.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIAlertControllerPushStyle) {
    UIAlertControllerPushFIFO,
    UIAlertControllerPushLIFO
};

@interface UIViewController (UIAlertControllerPush)

- (void)presentAlertViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag type:(UIAlertControllerPushStyle)style completion:(void (^)(void))completion;

@end
