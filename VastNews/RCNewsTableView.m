//
//  RCNewsTableView.m
//  VastNews
//
//  Created by 任超 on 2017/12/13.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCNewsTableView.h"
#import "RCNewsTableViewCell.h"

@interface RCNewsTableView ()<UITableViewDataSource>

@end

@implementation RCNewsTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.rowHeight = 100;
    }
    
    return self;
}


#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifierString = @"identifierString";
    
    RCNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[RCNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell ;
}



@end
