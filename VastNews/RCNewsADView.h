//
//  RCNewsADView.h
//  VastNews
//
//  Created by 任超 on 2017/12/13.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义广告栏点击的block
typedef void(^RCAdTapBlock)(int index);

@interface RCNewsADView : UIView

@property (nonatomic, strong) UIScrollView *rcADScrollerView;
@property (nonatomic, strong) UIPageControl *rcPageController;

@property (nonatomic, copy) RCAdTapBlock rcAdTapBlcok;

@end
