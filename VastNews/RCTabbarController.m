//
//  RCTabbarController.m
//  VastNews
//
//  Created by 任超 on 2017/12/12.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCTabbarController.h"
#import "RCNewsViewController.h"
#import "RCONEViewController.h"

@interface RCTabbarController ()

@end

@implementation RCTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configTabbarController];
    [self loadSubControllers];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//配置tabbar
- (void)configTabbarController{
    
    [self.tabBar setClipsToBounds:YES];
    self.tabBar.tintColor = MainColor;
    self.tabBar.translucent = NO;
}

//加载子控制器
- (void)loadSubControllers{
    
    RCNewsViewController *rcNewsViewController = [[RCNewsViewController alloc]init];
    UINavigationController *rcNewsNavigationController = [[UINavigationController alloc]initWithRootViewController:rcNewsViewController];
    
    //关闭Nav的半透明，解决控件坐标异常偏移的问题
    rcNewsNavigationController.navigationBar.translucent = NO;
    rcNewsNavigationController.navigationBar.barTintColor = MainColor;
    
    UIImage *itemPic1 = [UIImage imageNamed:@"新闻"];
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"新闻" image:itemPic1 tag:1];
    rcNewsViewController.tabBarItem = item1;
    
    
    RCONEViewController *rcONEViewController = [[RCONEViewController alloc]init];
    UINavigationController *rcONENavigationController = [[UINavigationController alloc]initWithRootViewController:rcONEViewController];
    UIImage *itemPic2 = [UIImage imageNamed:@"消息"];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"七个" image:itemPic2 tag:2];
    rcONEViewController.tabBarItem = item2;
    
    NSArray *rcViewControllers = @[rcNewsNavigationController,rcONENavigationController];
    
    [self setViewControllers:rcViewControllers animated:YES];
    
}

@end
