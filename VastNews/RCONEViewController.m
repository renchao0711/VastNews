//
//  RCONEViewController.m
//  VastNews
//
//  Created by 任超 on 2017/12/12.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCONEViewController.h"
#import "RCOneView.h"

@interface RCONEViewController ()<UIScrollViewDelegate>

@property (nonatomic,copy) NSMutableArray *indexArray;
@property (nonatomic,strong) UIScrollView *rcOneScrollerView;

@end

@implementation RCONEViewController

- (NSMutableArray *)indexArray{
    if (!_indexArray) {
        _indexArray = [[NSMutableArray alloc]initWithObjects:@1,@0,@0,@0,@0,@0,@0,nil];
    }
    return _indexArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"七个";
    
    //关闭Nav的半透明，解决控件坐标异常偏移的问题
    self.navigationController.navigationBar.translucent = NO;
    
    [self setUpViews];
}


- (void)setUpViews{
    
    self.rcOneScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, RCScreenH-44)];
    _rcOneScrollerView.pagingEnabled = YES;
    _rcOneScrollerView.delegate = self;
    _rcOneScrollerView.contentSize = CGSizeMake(RCScreenW * 7, 0);
    [self.view addSubview:_rcOneScrollerView];
    
    RCOneView *rcOneViews = [[RCOneView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, RCScreenH)];
    [_rcOneScrollerView addSubview:rcOneViews];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int index = (int)((scrollView.contentOffset.x)/RCScreenW);
    
    if ([self.indexArray[index] isEqual:@0]) {
        RCOneView *rcOneViews = [[RCOneView alloc]initWithFrame:CGRectMake(RCScreenW*index, 0, RCScreenW, RCScreenH)];
        [_rcOneScrollerView addSubview:rcOneViews];
        self.indexArray[index] = @1;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
