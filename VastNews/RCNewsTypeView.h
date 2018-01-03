//
//  RCNewsTypeView.h
//  VastNews
//
//  Created by 任超 on 2017/12/12.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义block
typedef void(^ContentToTitleBlock)(int index);
typedef void(^TitleToContentBlock)(int index);

//自定义翻页scroll的代理
@protocol rcNewsTypeViewDelegate <NSObject>

- (void)rcNewsTypeViewDidScroll:(int)index;

@end

@interface RCNewsTypeView : UIView

@property (nonatomic,strong) UIScrollView *rcContentScrollerView; //内容滑动视图

@property (nonatomic,copy) ContentToTitleBlock contentToTitleBlock; //滑动内容scroll改变标题位置
@property (nonatomic,copy) TitleToContentBlock titleToContentBlock; //滑动内容scroll改变标题位置

@property (nonatomic,weak) id <rcNewsTypeViewDelegate> Delegate;

@end
