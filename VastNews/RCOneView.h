//
//  RCOneView.h
//  VastNews
//
//  Created by 任超 on 2018/1/2.
//  Copyright © 2018年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCOneView : UIView

@property (nonatomic, strong) UIImageView *rcOneViewImage; //图片
@property (nonatomic, strong) UITextView *rcOneViewText;      //短句
@property (nonatomic, strong) UILabel *rcOneViewVol;       //序号
@property (nonatomic, strong) UILabel *rcOneViewTime;      //日期

@end
