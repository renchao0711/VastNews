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
#import "RCNewsDetailViewController.h"
#import "RCLoginViewController.h"


int page;  //存页数

@interface RCNewsViewController ()<UIScrollViewDelegate,rcNewsTypeViewDelegate,UITableViewDelegate>

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
    
    [self setUpNavStyle];
    [self setUpNewsTypeView];
    [self setUpNewsTableView];
    [self recieveIndexBlcok];
    
    self.typeView.Delegate = self;
    self.rcAdView.rcADScrollerView.delegate = self;
    
    //有bug
    self.rcAdView.rcAdTapBlcok = ^(int index){
        NSLog(@"777");
    };
    
    //[self refresh];
    
}

////网络请求JSON数据
//-(void)refresh{
//    
//    NSLog(@"fresh");
//    
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    
//    NSString *url1 = @"http://v.juhe.cn/toutiao/index";
//    AFHTTPSessionManager *session1 = [AFHTTPSessionManager manager];
//    session1.responseSerializer = [AFJSONResponseSerializer serializer];
//    session1.requestSerializer = [AFHTTPRequestSerializer serializer];
//    [session1.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
//    session1.requestSerializer.timeoutInterval = 10;
//    [session1 POST:url1 parameters:@{@"type":@"top",@"key":@"a89f838a518b5d25515d21894926605f"} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSLog(@"responseObject:%@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        NSLog(@"%@",error);
//    }];
//}


//设置导航栏样式
- (void)setUpNavStyle{
    
    self.title = @"新闻";
    self.navigationController.navigationBar.titleTextAttributes
    = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登陆/注册" style:UIBarButtonItemStylePlain target:self action:@selector(navLeftButtonAction)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

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
    
    rcNewsTableView.delegate = self;
    
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
    self.typeView.contentToTitleBlock((int)(offsetX/RCScreenW)+0.5);
}

//点击button让内容翻页的block方法实现
- (void)recieveIndexBlcok{
    
    __weak typeof (self) weakSelf = self;
    
    self.typeView.titleToContentBlock = ^(int index){
        
        NSLog(@"-------------%d",index);
        [weakSelf.typeView.rcContentScrollerView setContentOffset:CGPointMake(index*RCScreenW, 0) animated:YES];
    };
}

//实现自定义代理方法
-(void)rcNewsTypeViewDidScroll:(int)index{
    
    //判断是否加载过视图
    if ([self.tableViewArray[index]  isEqual: @0]) {
        RCNewsTableView *rcNewsTableView = [[RCNewsTableView alloc]initWithFrame:CGRectMake(index*RCScreenW, 0, RCScreenW, self.typeView.rcContentScrollerView.frame.size.height) style:UITableViewStylePlain];
        
        rcNewsTableView.delegate = self;
        
        [self.typeView.rcContentScrollerView addSubview:rcNewsTableView];
        self.tableViewArray[1] = [NSNumber numberWithInt:1];
        NSLog(@"123");
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RCNewsDetailViewController *rcNewsDetailViewController = [[RCNewsDetailViewController alloc]init];
    
    rcNewsDetailViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rcNewsDetailViewController animated:YES];
}

- (void)navLeftButtonAction{
    NSLog(@"navLeftButtonAction");
    RCLoginViewController *rcLoginViewController = [[RCLoginViewController alloc]init];
    [self presentViewController:rcLoginViewController animated:YES completion:nil];
}

- (void)dealloc{
    [self.timer invalidate];  //停止计时器
}

@end
