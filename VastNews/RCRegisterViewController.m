//
//  RCRegisterViewController.m
//  VastNews
//
//  Created by 任超 on 2018/1/3.
//  Copyright © 2018年 任超. All rights reserved.
//

#import "RCRegisterViewController.h"
#import "RCRegisterView.h"

@interface RCRegisterViewController ()<RCRegisterViewDelegate>

@end

@implementation RCRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    RCRegisterView *rcRegisterView = [[RCRegisterView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, RCScreenH)];
    rcRegisterView.Delegate = self;
    [self.view addSubview:rcRegisterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)userDidClickBackButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
