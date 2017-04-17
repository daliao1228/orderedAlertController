//
//  UIViewController+UIAlertControllerPush.m
//  orderedAlertController
//
//  Created by lsy on 2017/4/17.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import "UIViewController+UIAlertControllerPush.h"
#import "UIAlertController+UIAlertControllerPush.h"

@implementation UIViewController (UIAlertControllerPush)

- (void)presentAlertViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag type:(UIAlertControllerPushStyle)style completion:(void (^)(void))completion {
    
    if (![viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        NSAssert(YES, @"This method is Using for presenting AlertController only");
        return;
    }
    
    if (style == UIAlertControllerPushFIFO) {
        [self presentViewControllerInFIFO:viewControllerToPresent animated:flag completion:completion];
    } else {
        [self presentViewControllerInLIFO:viewControllerToPresent animated:flag completion:completion];
    }
}

- (void)presentViewControllerInFIFO:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        UIAlertController *controller = (UIAlertController *)viewControllerToPresent;
        controller.block = ^{
            dispatch_semaphore_signal(semaphore);
        };
        
        dispatch_sync(dispatch_get_main_queue(), ^ {
            [self presentViewController:controller animated:flag completion:completion];
        });
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }];
    
    NSOperation *lastOperation = [[[self getOperationQueue] operations] lastObject];
    if (lastOperation) {
        [operation addDependency:lastOperation];
    }
    [[self getOperationQueue] addOperation:operation];
}

- (void)presentViewControllerInLIFO:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
}

- (NSOperationQueue *)getOperationQueue {
    static NSOperationQueue *queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[NSOperationQueue alloc] init];
    });
    return queue;
}

@end
