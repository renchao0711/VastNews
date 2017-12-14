//
//  RCNewsTableViewCell.m
//  VastNews
//
//  Created by 任超 on 2017/12/13.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCNewsTableViewCell.h"

@interface RCNewsTableViewCell()

@property (nonatomic ,strong)  UIImageView *newsImage;
@property (nonatomic ,strong)  UILabel *newsTitle;
@property (nonatomic ,strong)  UILabel *newsTime;

@end

@implementation RCNewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpMyCell];
        
    }
    return self;
}


- (void)setUpMyCell{
    
    //加图
    self.newsImage = [[UIImageView alloc]initWithFrame:CGRectMake(8 , 8, 120, 81)];
    self.newsImage.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.newsImage];
    
    //加标题label
    self.newsTitle = [[UILabel alloc]initWithFrame:CGRectMake(8+120+8, 8, RCScreenW-136-8, 81-10)];
    self.newsTitle.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.newsTitle];
    
    //加时间label
    self.newsTime = [[UILabel alloc]initWithFrame:CGRectMake(8+120+8+self.newsTitle.frame.size.width-100, 8+81-10, 100, 10)];
    self.newsTime.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.newsTime];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
