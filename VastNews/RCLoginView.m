//
//  RCLoginView.m
//  VastNews
//
//  Created by 任超 on 2018/1/3.
//  Copyright © 2018年 任超. All rights reserved.
//

#import "RCLoginView.h"

@interface RCLoginView ()<UITextFieldDelegate>

@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UIImageView *lineView1;
@property (nonatomic,strong) UIImageView *lineView2;
@property (nonatomic,strong) UIImageView *iconImage1;
@property (nonatomic,strong) UIImageView *iconImage2;
@property (nonatomic,strong) UILabel *rememberLabel;

@property (nonatomic,strong) UITextField *rcTextField1;
@property (nonatomic,strong) UITextField *rcTextField2;
@property (nonatomic,strong) UIButton *rcLoginButton;
@property (nonatomic,strong) UIButton *rcClikButton;
@property (nonatomic,strong) UIButton *rcRegisterButton;

@end

@implementation RCLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self setUpSubviews];
    }
    
    return self;
}

- (void)setUpSubviews{
    
    //返回键
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(5, 25, 40, 40);
    [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [_backButton setTintColor:[UIColor whiteColor]];
    [_backButton.titleLabel setFont:[UIFont fontWithName:@"PingFang SC" size:19]];
    [_backButton addTarget:self action:@selector(_backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backButton];
    
    //用户登录Label
    _topLabel = [UILabel new];
    _topLabel.text = @"用户登录";
    _topLabel.textColor = [UIColor whiteColor];
    _topLabel.textAlignment =NSTextAlignmentCenter;
    _topLabel.font = [UIFont fontWithName:@"PingFang SC" size:19];
    [self addSubview:_topLabel];

    //横线1
    _lineView1 = [UIImageView new];
    UIImage *img = [UIImage imageNamed:@"line"];
    [_lineView1 setImage:img];
    _lineView1.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_lineView1];

    //横线2
    _lineView2 = [UIImageView new];
    [_lineView2 setImage:img];
    _lineView2.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_lineView2];
    
    //两行图标
    _iconImage1 = [UIImageView new];
    [_iconImage1 setImage:[UIImage imageNamed:@"账号"]];
    _iconImage2 = [UIImageView new];
    [_iconImage2 setImage:[UIImage imageNamed:@"密码"]];
    [self addSubview:_iconImage1];
    [self addSubview:_iconImage2];
    
    //输入行
    _rcTextField1 = [UITextField new];
    _rcTextField1.textColor = [UIColor blackColor];
    _rcTextField1.placeholder = @"账号";
    _rcTextField1.keyboardType = UIKeyboardTypeNumberPad ;
    _rcTextField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    _rcTextField1.delegate = self;
    
    _rcTextField2 = [UITextField new];
    _rcTextField2.placeholder = @"密码";
    _rcTextField2.keyboardType = UIKeyboardTypeASCIICapable;
    _rcTextField2.secureTextEntry = YES;
    _rcTextField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    _rcTextField2.delegate = self;
    
    [self addSubview:_rcTextField1];
    [self addSubview:_rcTextField2];
    
    _rememberLabel = [UILabel new];
    _rememberLabel.text = @"记住密码";
    _rememberLabel.textColor = [UIColor darkGrayColor];
    _rememberLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [self addSubview:_rememberLabel];
    
    self.rcClikButton = [UIButton new];
    [self.rcClikButton setImage:[UIImage imageNamed:@"复选-未选中"] forState:UIControlStateNormal];
    [self.rcClikButton setImage:[UIImage imageNamed:@"复选框 已选"] forState:UIControlStateSelected];
    [self.rcClikButton addTarget:self action:@selector(nilSymbol) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rcClikButton];
    
    self.rcRegisterButton = [UIButton new];
    [self.rcRegisterButton setTitle:@"注册" forState:UIControlStateNormal];
    self.rcRegisterButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [self.rcRegisterButton.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    self.rcRegisterButton.tintColor = [UIColor redColor];
    self.rcRegisterButton.backgroundColor = MainColor;
    [self.rcRegisterButton addTarget:self action:@selector(_registerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rcRegisterButton];

    self.rcLoginButton = [UIButton new];
    self.rcLoginButton.backgroundColor = MainColor;
    [self.rcLoginButton setTitle:@"登录" forState:UIControlStateNormal];
    self.rcLoginButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:18];
    [self.rcLoginButton.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    self.rcLoginButton.tintColor = [UIColor whiteColor];
    [self.rcLoginButton addTarget:self action:@selector(nilSymbol) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rcLoginButton];

}

- (void)layoutSubviews{
    
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backButton);
        make.centerX.equalTo(self);
        make.height.equalTo(100);
        make.width.equalTo(100);
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(55);
        make.right.equalTo(self).with.offset(-55);
        make.top.equalTo(self).with.offset(170);
        make.height.mas_equalTo(1);
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineView1);
        make.right.equalTo(_lineView1);
        make.top.equalTo(_lineView1).with.offset(55);
        make.height.mas_equalTo(1);
    }];
    
    [_iconImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_lineView1).with.offset(-5);
        make.left.equalTo(_lineView1);
        make.size.mas_equalTo(CGSizeMake(28, 32));
    }];
    [_iconImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_lineView2).with.offset(-5);
        make.left.equalTo(_lineView2);
        make.size.mas_equalTo(_iconImage1);
    }];
    
    [_rcTextField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImage1.mas_right).offset(8);
        make.bottom.equalTo(_iconImage1).offset(-5);
        make.right.equalTo(_lineView1);
    }];
    
    [_rcTextField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImage2.mas_right).offset(8);
        make.bottom.equalTo(_iconImage2).offset(-5);
        make.right.equalTo(_lineView2);
    }];
    
    [self.rcClikButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView2).offset(13);
        make.left.equalTo(_iconImage2);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_rememberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rcClikButton);
        make.size.mas_equalTo(CGSizeMake(60, 20));
        make.left.equalTo(self.rcClikButton.mas_right).offset(5);
    }];
    
    [self.rcRegisterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rcClikButton);
        make.right.mas_equalTo(_lineView2);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    
    [self.rcLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.left.equalTo(_lineView1);
        make.right.equalTo(_lineView1);
        make.top.equalTo(_lineView2.mas_bottom).offset(85);
    }];
}

- (void)_backButtonAction{
    if ([self.Delegate respondsToSelector:@selector(userDidClickBackButton)]) {
        [self.Delegate userDidClickBackButton];
    }
}

- (void)_registerButtonAction{
    if ([self.Delegate respondsToSelector:@selector(userDidClickRegisterButton)]) {
        [self.Delegate userDidClickRegisterButton];
    }
}

@end
