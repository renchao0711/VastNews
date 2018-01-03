//
//  RCOneView.m
//  VastNews
//
//  Created by 任超 on 2018/1/2.
//  Copyright © 2018年 任超. All rights reserved.
//

#import "RCOneView.h"

@implementation RCOneView

- (UIView *)rcOneViewImage{
    if (!_rcOneViewImage) {
        _rcOneViewImage = [[UIImageView alloc]init];
    }
    return _rcOneViewImage;
}

- (UILabel *)rcOneViewVol{
    if (!_rcOneViewVol) {
        _rcOneViewVol = [[UILabel alloc]init];
    }
    return _rcOneViewVol;
}

- (UILabel *)rcOneViewTime{
    if (!_rcOneViewTime) {
        _rcOneViewTime = [[UILabel alloc]init];
    }
    return _rcOneViewTime;
}

- (UITextView *)rcOneViewText{
    if (!_rcOneViewText) {
        _rcOneViewText = [[UITextView alloc]init];
    }
    return _rcOneViewText;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self setUpOneViewStyle];
    }
    
    return self;
}

//自定义ONE的视图样式
- (void)setUpOneViewStyle{
    
    [self.rcOneViewImage setImage:[UIImage imageNamed:@"4"]];
    [self addSubview:_rcOneViewImage];
    
    [self.rcOneViewVol setText:@"VOL.1713"];
    [_rcOneViewVol setFont:[UIFont systemFontOfSize:13]];
    [self addSubview:_rcOneViewVol];
    
    [self.rcOneViewTime setText:@"Jun 15,2017"];
    [_rcOneViewTime setFont:[UIFont systemFontOfSize:13]];
    _rcOneViewTime.textAlignment = NSTextAlignmentRight;
    [self addSubview:_rcOneViewTime];
    
    [self.rcOneViewText setText:@"有的人，没事时喜欢在朋友圈里到处点赞，东评论一句西评论一句，比谁都有存在感。等你有事找他了，他就立刻变得很忙，让你再也找不着。真正的朋友，平常很少联系。可一旦你遇上了难处，他会立刻回复你的消息，第一时间站出来帮你。所谓的存在感，不是你有没有出现，而是你的出现有没有价值。存在感，不是刷出来的，也不是说出来的。有存在感，未必是要个性锋芒毕露、甚至锋利扎人。有的人，没事时喜欢在朋友圈里到处点赞，东评论一句西评论一句，比谁都有存在感。等你有事找他了，他就立刻变得很忙，让你再也找不着。真正的朋友，平常很少联系。可一旦你遇上了难处，他会立刻回复你的消息，第一时间站出来帮你。所谓的存在感，不是你有没有出现，而是你的出现有没有价值。存在感，不是刷出来的，也不是说出来的。有存在感，未必是要个性锋芒毕露、甚至锋利扎人。翩翩君子，温润如玉，真正有存在感的人，反而不会刻意去强调他的存在感。他的出现，永远都恰到好处。我所欣赏的存在感，不是长袖善舞巧言令色，而是对他人的真心关照；不是锋芒毕露计较胜负，而是让人相处得舒服；不是时时刻刻聒噪不休，而是关键时刻能挺身而出。别总急着出风头，希望你能有恰到好处的存在感。"];
    [_rcOneViewText setEditable:NO];
    [_rcOneViewText setFont:[UIFont systemFontOfSize:13.5]];
    [self addSubview:_rcOneViewText];
    
    

    
}

- (void)layoutSubviews{
    
    [_rcOneViewImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
        make.right.offset(-15);
        make.width.equalTo(@(RCScreenW-30));
        make.height.mas_equalTo(_rcOneViewImage.mas_width).multipliedBy(0.9);
    }];
    
    [_rcOneViewVol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_rcOneViewImage);
        make.top.equalTo(_rcOneViewImage.bottom).offset(10);
        make.size.equalTo(CGSizeMake(100, 20));
    }];
    
    [_rcOneViewTime mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(_rcOneViewImage);
        make.top.equalTo(_rcOneViewImage.bottom).offset(10);
        make.size.equalTo(CGSizeMake(100, 20));
    }];
    
    [_rcOneViewText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rcOneViewVol.bottom).offset(10);
        make.left.right.equalTo(_rcOneViewImage);
        make.bottom.equalTo(self.bottom).offset(-44-64);
    }];
    
    
    
}





@end
