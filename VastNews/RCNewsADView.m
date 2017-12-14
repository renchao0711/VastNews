//
//  RCNewsADView.m
//  VastNews
//
//  Created by 任超 on 2017/12/13.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCNewsADView.h"

@interface RCNewsADView ()<UIScrollViewDelegate>


@end

@implementation RCNewsADView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        [self setUpRcADNewsView];
    }
    
    return self;
}

- (void)setUpRcADNewsView{
    
    //初始化广告滚动scroller
    _rcADScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, RCScreenW*0.5)];
    _rcADScrollerView.contentSize = CGSizeMake(RCScreenW * 4, 0);
    _rcADScrollerView.pagingEnabled = YES;
    _rcADScrollerView.showsVerticalScrollIndicator = NO;
    _rcADScrollerView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_rcADScrollerView];
    
    _rcADScrollerView.delegate = self;
    
    //初始化四张广告
    for (int i = 0; i < 4; i++) {
        UIImageView *rcADImageView = [[UIImageView alloc]init];
        rcADImageView.image = [UIImage imageNamed:@"4"];
        rcADImageView.contentMode = UIViewContentModeScaleToFill;
        rcADImageView.frame = CGRectMake(i * RCScreenW, 0, RCScreenW, RCScreenW*0.5);
        [_rcADScrollerView addSubview:rcADImageView];
        
        //初始化广告标题
        UILabel *rcADTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, RCScreenW*0.5-30, RCScreenW, 30)];
        rcADTitleLabel.text = [NSString stringWithFormat:@" 这是广告标题"];
        rcADTitleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13];
        rcADTitleLabel.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:0 alpha:0.6];
        rcADTitleLabel.textColor = [UIColor whiteColor];
        rcADTitleLabel.numberOfLines = 0;
        [rcADImageView addSubview:rcADTitleLabel];
        
    }
    
    _rcPageController = [[UIPageControl alloc]initWithFrame:CGRectMake(RCScreenW - 50, RCScreenW*0.5-25, 35, 20)];
    _rcPageController.numberOfPages = 4;
    _rcPageController.currentPage = 0;
    _rcPageController.currentPageIndicatorTintColor = MainColor;
    [self addSubview:_rcPageController];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x/RCScreenW;
    _rcPageController.currentPage = page;
}

@end
