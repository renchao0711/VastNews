//
//  RCLoginViewController.m
//  VastNews
//
//  Created by 任超 on 2018/1/3.
//  Copyright © 2018年 任超. All rights reserved.
//

#import "RCLoginViewController.h"
#import "RCLoginView.h"
#import "RCRegisterViewController.h"


@interface RCLoginViewController ()<RCLoginViewDelegate>

@end

@implementation RCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    
    [self setUpSubviews];
}

//自定义视图
- (void)setUpSubviews{
    
    RCLoginView *rcLoginView= [[RCLoginView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, RCScreenH)];
    rcLoginView.Delegate = self;
    [self.view addSubview:rcLoginView];
    
}

//返回
- (void)userDidClickBackButton{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)userDidClickRegisterButton{
    RCRegisterViewController *rcRegisterViewController = [[RCRegisterViewController alloc]init];
    [self presentViewController:rcRegisterViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
