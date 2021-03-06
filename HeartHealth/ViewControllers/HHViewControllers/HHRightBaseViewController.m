//
//  HHRightViewController.m
//  HeartHealth
//
//  Created by 赵锋 on 15/7/2.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "HHRightBaseViewController.h"
#import "Okeys.h"
@interface HHRightBaseViewController ()

@property(nonatomic, strong) UIButton *openDrawerButton;
@property(nonatomic, strong) UIButton *rightHandleButton;//右边操作的按钮
@end

@implementation HHRightBaseViewController

- (instancetype)init
{
    self=[super init];
    if (self) {
        [self initParams];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor redColor];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.openDrawerButton];
    
    if ([self rightHandleButtonHidden]==NO) {
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.rightHandleButton];
    }
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark ---控制器基本参数

-(void)initParams
{
    self.viewControllerKey=@"HHRightBaseViewController";
    
}
#pragma mark ---控制器基本视图
-(UIButton *)openDrawerButton
{
    if (_openDrawerButton==nil) {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
        button.frame=CGRectMake(0, 0, 44, 44);
        [button addTarget:self action:@selector(openDrawer:) forControlEvents:UIControlEventTouchUpInside];
        _openDrawerButton=button;
    }
    
    return _openDrawerButton;
}
-(UIButton *)rightHandleButton
{
    if (_rightHandleButton==nil) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
        button.frame=CGRectMake(0, 0, 44, 44);
        [button addTarget:self action:@selector(rightHandle:) forControlEvents:UIControlEventTouchUpInside];
        
        _rightHandleButton=button;
    }
    return _rightHandleButton;
}

-(BOOL)rightHandleButtonHidden{
    
    return NO;
}

#pragma mark ---基本视图的操作
-(void)openDrawer:(UIButton *)button
{
    [OLog showMessage:@"open Drawer"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:openDrawer object:nil];
    
}
-(void)rightHandle:(UIButton *)button
{
    [OLog showMessage:@"右顶上的按钮触发了"];
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
