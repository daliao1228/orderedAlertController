//
//  UIAlertController+UIAlertControllerPush.m
//  orderedAlertController
//
//  Created by lsy on 2017/4/17.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import "UIAlertController+UIAlertControllerPush.h"
#import <objc/runtime.h>

static const char *AlertDismissCompletionBlock = "AlertDismissCompletionBlock";

@implementation UIAlertController (UIAlertControllerPush)

+ (void)load {
    SEL oldSel = @selector(viewWillDisappear:);
    SEL newSel = @selector(alert_viewWillDisappear:);
    Method oldMothod = class_getInstanceMethod([self class], oldSel);
    Method newMethod = class_getInstanceMethod([self class], newSel);
    BOOL isMethodAdded = class_addMethod([self class], oldSel, class_getMethodImplementation([self class], newSel), method_getTypeEncoding(newMethod));
    if (isMethodAdded) {
        class_replaceMethod([self class], newSel, method_getImplementation(oldMothod), NULL);
    } else {
        method_exchangeImplementations(oldMothod, newMethod);
    }
}

- (void)alert_viewWillDisappear:(BOOL)animated {
    [self alert_viewWillDisappear:animated];
    if (self.block) {
        self.block();
    }
}

- (void)setBlock:(DismissCompletionBlock)block {
    objc_setAssociatedObject(self, AlertDismissCompletionBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DismissCompletionBlock)block {
    return objc_getAssociatedObject(self, AlertDismissCompletionBlock);
}

@end
