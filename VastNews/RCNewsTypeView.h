//
//  RCNewsTypeView.h
//  VastNews
//
//  Created by 任超 on 2017/12/12.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义block
typedef void(^ContentToTitle)(int index);
typedef void(^TitleToContent)(int index);

//自定义翻页scroll的代理
@protocol rcNewsTypeViewDelegate <NSObject>

- (void)rcNewsTypeViewDidScroll:(int)index;

@end

@interface RCNewsTypeView : UIView

@property (nonatomic,strong) UIScrollView *rcContentScrollerView; //内容滑动视图

@property (nonatomic,copy) ContentToTitle contentToTitle; //滑动内容scroll改变标题位置
@property (nonatomic,copy) TitleToContent titleToContent; //滑动内容scroll改变标题位置

@property (nonatomic,weak) id <rcNewsTypeViewDelegate> Delegate;

@end
