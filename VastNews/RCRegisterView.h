//
//  RCRegisterView.h
//  VastNews
//
//  Created by 任超 on 2018/1/3.
//  Copyright © 2018年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RCRegisterViewDelegate <NSObject>

- (void)userDidClickBackButton;

@end

@interface RCRegisterView : UIView

@property (nonatomic,weak) id <RCRegisterViewDelegate> Delegate;


@end
