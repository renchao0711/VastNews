//
//  RCNewsViewController.m
//  VastNews
//
//  Created by 任超 on 2017/12/12.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCNewsViewController.h"
#import "RCNewsTypeView.h"
#import "RCNewsTableView.h"
#import "RCNewsADView.h"
#import "NSTimer+RcAdViewUnretain.h"

int page;  //存页数

@interface RCNewsViewController ()<UIScrollViewDelegate,rcNewsTypeViewDelegate>

@property (nonatomic, strong) RCNewsTypeView *typeView;
@property (nonatomic, strong) RCNewsADView *rcAdView;

@property (nonatomic, copy) NSMutableArray * tableViewArray;  //对应八页TableView，为1时是有视图，为0是需要加载视图

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation RCNewsViewController

- (NSMutableArray* )tableViewArray{
    if(!_tableViewArray){
        _tableViewArray = [NSMutableArray arrayWithObjects:@1,@0,@0,@0,@0,@0,@0,@0, nil];
    }
    return _tableViewArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"新闻";
    
    [self setUpNewsTypeView];
    [self setUpNewsTableView];
    [self recieveIndexBlcok];
    
    self.typeView.Delegate = self;
    
    self.rcAdView.rcADScrollerView.delegate = self;

}

//实例化分类视图
- (void)setUpNewsTypeView{
    
    _typeView = [[RCNewsTypeView alloc] initWithFrame:CGRectMake(0, 0, RCScreenW, self.view.frame.size.height - 49)];

    _typeView.rcContentScrollerView.delegate = self;
    _typeView.rcContentScrollerView.pagingEnabled = YES;
    
    [self.view addSubview:_typeView];
}

//实例化第一个tableView
- (void)setUpNewsTableView{
    
    RCNewsTableView *rcNewsTableView = [[RCNewsTableView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, self.typeView.rcContentScrollerView.frame.size.height) style:UITableViewStylePlain];
    [_typeView.rcContentScrollerView addSubview:rcNewsTableView];
    
    RCNewsADView *rcADNewsView = [[RCNewsADView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, RCScreenW*0.5)];
    rcNewsTableView.tableHeaderView = rcADNewsView;
    
    
    //开启广告轮播定时器
    self.timer = [NSTimer RC_timerWithTimeInterval:4 repeats:YES block:^(NSTimer *timer) {
        page = (int)rcADNewsView.rcPageController.currentPage;
        if (page == rcADNewsView.rcPageController.numberOfPages - 1) {
            page = 0;
            rcADNewsView.rcPageController.currentPage = 0;
        }else{
            page ++;
            rcADNewsView.rcPageController.currentPage++;
        }
        CGFloat offsetX = page * RCScreenW;
        [rcADNewsView.rcADScrollerView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//减速停止的时候开始执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSLog(@"%f",scrollView.contentOffset.x);
    self.typeView.contentToTitle((int)(offsetX/RCScreenW)+0.5);
}

//点击button让内容翻页的block方法实现
- (void)recieveIndexBlcok{
    
    __weak typeof (self) weakSelf = self;
    
    self.typeView.titleToContent = ^(int index){
        
        NSLog(@"-------------%d",index);
        [weakSelf.typeView.rcContentScrollerView setContentOffset:CGPointMake(index*RCScreenW, 0) animated:YES];
    };
}

//实现自定义代理方法
-(void)rcNewsTypeViewDidScroll:(int)index{
    
    //判断是否加载过视图
    if ([self.tableViewArray[index]  isEqual: @0]) {
        RCNewsTableView *rcNewsTableView = [[RCNewsTableView alloc]initWithFrame:CGRectMake(index*RCScreenW, 0, RCScreenW, self.typeView.rcContentScrollerView.frame.size.height) style:UITableViewStylePlain];
        [self.typeView.rcContentScrollerView addSubview:rcNewsTableView];
        self.tableViewArray[1] = [NSNumber numberWithInt:1];
        NSLog(@"123");
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"2333");
}

- (void)dealloc{
    [self.timer invalidate];  //停止计时器
}

@end
