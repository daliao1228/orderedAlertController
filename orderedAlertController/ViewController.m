//
//  ViewController.m
//  orderedAlertController
//
//  Created by lsy on 2017/4/17.
//  Copyright © 2017年 lsy. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+UIAlertControllerPush.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"first test 1" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    UIAlertController *controller2 = [UIAlertController alertControllerWithTitle:@"first test 2" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [controller2 addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    UIAlertController *controller3 = [UIAlertController alertControllerWithTitle:@"first test 3" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [controller3 addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    UIAlertController *controller4 = [UIAlertController alertControllerWithTitle:@"first test 4" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [controller4 addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentAlertViewController:controller animated:YES type:UIAlertControllerPushFIFO completion:nil];
    [self presentAlertViewController:controller2 animated:YES type:UIAlertControllerPushFIFO completion:nil];
    [self presentAlertViewController:controller3 animated:YES type:UIAlertControllerPushFIFO completion:nil];
    [self presentAlertViewController:controller4 animated:YES type:UIAlertControllerPushFIFO completion:nil];
}


@end
