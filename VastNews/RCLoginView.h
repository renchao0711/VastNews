//
//  RCLoginView.h
//  VastNews
//
//  Created by 任超 on 2018/1/3.
//  Copyright © 2018年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCLoginViewDelegate <NSObject>

- (void)userDidClickBackButton;
- (void)userDidClickRegisterButton;

@end

@interface RCLoginView : UIView

@property (nonatomic,strong) UIButton *rcBackButton;

@property (nonatomic,weak) id <RCLoginViewDelegate> Delegate;

@end
