//
//  HHUserHeadCell.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/3.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHUserHeadCell.h"

#define HeadImageWidth  100.0

@interface HHUserHeadCell ()
@property (nonatomic, strong)UIImageView *userHeadImageView;
@property (nonatomic, copy) UILabel *userNameLabel;
@property (nonatomic, strong ,readwrite) NSNumber *cellHeight;
@end

@implementation HHUserHeadCell

@synthesize cellHeight=_cellHeight;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor=[UIColor blueColor];
        [self.contentView addSubview:self.userHeadImageView];
        [self.contentView addSubview:self.userNameLabel];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

#pragma  mark --布局

-(void)initConstraints
{
    [self.userHeadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(@130);
        make.top.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(HeadImageWidth, HeadImageWidth));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(@160);
        make.height.mas_equalTo(@30);
        make.centerX.mas_equalTo(self.userHeadImageView.mas_centerX);
        make.top.mas_equalTo(self.userHeadImageView.mas_bottom).offset(5);
        
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.userNameLabel.mas_bottom).offset(10);
    }];

    CGSize  size  =[self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    self.cellHeight=[NSNumber numberWithFloat:(size.height+1.0)];
    
    [OLog showMessage:@"User Head Cell height :%f",[self.cellHeight floatValue]];

}

#pragma mark -- 视图
- (UIImageView *)userHeadImageView
{
    if (_userHeadImageView==nil) {
        
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.backgroundColor=[UIColor redColor];
        imageView.layer.masksToBounds=YES;
        imageView.layer.cornerRadius=HeadImageWidth/2.0;
        imageView.layer.borderWidth=5.0;
        imageView.layer.borderColor=[UIColor lightGrayColor].CGColor;
        
        _userHeadImageView=imageView;
    }
    
    return _userHeadImageView;
}

- (UILabel *)userNameLabel
{
    if (_userNameLabel==nil) {
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectZero];
        label.font=[UIFont boldSystemFontOfSize:16.0];
        label.textColor=[UIColor darkTextColor];
        label.textAlignment=NSTextAlignmentCenter;
        label.backgroundColor=[UIColor redColor];
        
        _userNameLabel=label;
    }
    
    return _userNameLabel;
}

#pragma mark --- 属性赋值
- (void)setUserName:(NSString *)userName
{
    if (_userName!=userName) {
        _userName=[userName copy];
        self.userNameLabel.text=_userName;
    }
 
}

- (void)setHeadImage:(UIImage *)headImage
{
    if (_headImage!=headImage) {
        _headImage=headImage;
        
        self.userHeadImageView.image=_headImage;
    }
}

@end
