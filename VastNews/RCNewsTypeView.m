//
//  RCNewsTypeView.m
//  VastNews
//
//  Created by 任超 on 2017/12/12.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCNewsTypeView.h"

static CGFloat const titleH = 44;
int selectIndex = 100;

@interface RCNewsTypeView ()

@property (nonatomic,strong) UIScrollView *rcTitleScrollerView; //标题滑动视图

@property (nonatomic,strong) NSArray *titleButtonArray;
@property (nonatomic,strong) UIButton *selectedButton;

@end

@implementation RCNewsTypeView

- (NSArray *)titleButtonArray{
    if(!_titleButtonArray){
        _titleButtonArray = [NSArray arrayWithObjects:@"头条",@"社会",@"国内",@"国际",@"娱乐",@"体育",@"军事",@"科技", nil];
    }
    return _titleButtonArray;
}


//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
        [self setUpTitleScrollView];
        [self setUpContentScrollerView];
        [self setUpBlock];

    }
    
    return self;
}

//初始化分类标题的滚动视图
- (void)setUpTitleScrollView{
    
    self.rcTitleScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, RCScreenW, titleH)];
    [self addSubview:self.rcTitleScrollerView];
    
    [self setUpTitleButton];
}

//初始化标题button
- (void)setUpTitleButton{
    
    NSUInteger count = self.titleButtonArray.count;
    NSLog(@"%lu",(unsigned long)count);
    
    CGFloat buttonX = 0;
    CGFloat buttonW = 90;
    CGFloat buttonH = titleH;
    
    for(int i = 0;i < count;i++){
        
        buttonX = i * buttonW;
        CGRect buttonRect = CGRectMake(buttonX, 0, buttonW, buttonH);
        UIButton *button = [[UIButton alloc]initWithFrame:buttonRect];
        button.tag = i + 100;
        [button setTitle:_titleButtonArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.rcTitleScrollerView addSubview:button];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        //初始让第一个button变为已点击
        if (i == 0) {
            [self buttonClick:button];
        }
    }
    
    self.rcTitleScrollerView.contentSize = CGSizeMake(count * buttonW, titleH);
    self.rcTitleScrollerView.showsHorizontalScrollIndicator = NO;
    self.rcTitleScrollerView.showsVerticalScrollIndicator = NO;
    self.rcTitleScrollerView.bounces = NO;

}

//button的点击事件
- (void)buttonClick:(UIButton *)button{
    
    //得到已经变红的button
    UIButton *btn = (UIButton *)[self.rcTitleScrollerView viewWithTag:selectIndex];
    
    //把变红的button进行变黑和仿射还原操作
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.transform = CGAffineTransformIdentity;
    
    //把新点击的button进行变红操作
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    
    [self clickButtonToCenter:button];
    
    //保存目前的button的Tag值
    selectIndex = (int)button.tag;
    
    
    if (self.titleToContent) {
        self.titleToContent(selectIndex - 100);
    }
    
    //执行自定义delegate
    if ([self.Delegate respondsToSelector:@selector(rcNewsTypeViewDidScroll:)]){
        [self.Delegate rcNewsTypeViewDidScroll:(int)(button.tag - 100)];
    }
    
}

//让选中的button在中间
- (void)clickButtonToCenter:(UIButton *)button{
    
    CGFloat offset = button.center.x - RCScreenW * 0.5;
    if (offset < 0) {
        offset = 0;
    }
    
    CGFloat maxOffset = self.rcTitleScrollerView.contentSize.width - RCScreenW;
    if (offset > maxOffset) {
        offset = maxOffset;
    }
    
    [self.rcTitleScrollerView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
}

//--------------------------------------
//设置内容视图的ScrollerView
- (void)setUpContentScrollerView{
    
    CGFloat y = CGRectGetMaxY(self.rcTitleScrollerView.frame);
    self.rcContentScrollerView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, y, RCScreenW, self.frame.size.height - y - 64)];
    self.rcContentScrollerView.contentSize = CGSizeMake(RCScreenW * 8, 0);
    self.rcContentScrollerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.rcContentScrollerView];

}

//传回来的偏移量转换成index值，关联标题scrollerView
- (void)setUpBlock{
    
    __weak typeof (self) weakSelf = self;
    self.contentToTitle = ^(int index){
        NSLog(@"%d",index);
        
        UIButton *oldButton = (UIButton *)[weakSelf.rcTitleScrollerView viewWithTag:selectIndex];
        [oldButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        oldButton.transform = CGAffineTransformIdentity;
        
        UIButton *newButton = (UIButton *)[weakSelf.rcTitleScrollerView viewWithTag:index + 100];
        [newButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        newButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        selectIndex = index + 100;
        
        [weakSelf clickButtonToCenter:newButton];
        
        //调用自定义代理方法
        [weakSelf.Delegate rcNewsTypeViewDidScroll:index];
    };
}

//布局子控件的frame
- (void)layoutSubviews{
}

@end
