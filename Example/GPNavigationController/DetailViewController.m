//
//  DetailViewController.m
//  GPNavigationController_Example
//
//  Created by sgp on 2017/11/25.
//  Copyright © 2017年 ziyue92. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableDictionary *params = @{Nav_Left:@"返回",Nav_Title:@"自定义导航栏"}.mutableCopy;
    [self p_setTopTitleDetail:params];
    UILabel *descLbl = [UILabel new];
    descLbl.textColor  = [UIColor blackColor];
    descLbl.text = @"全屏侧滑返回到上一页,默认支持侧滑";
    [descLbl sizeToFit];
    descLbl.center = self.view.center;
    [self.view addSubview:descLbl];
    
    UIButton *descBtn = [UIButton new];
    [descBtn setTitle:@"点此关闭侧滑" forState:UIControlStateNormal];
    [descBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [descBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [descBtn sizeToFit];
    descBtn.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    [self.view addSubview:descBtn];
    
    UIButton *descBtn1 = [UIButton new];
    descBtn1.tag = 100;
    [descBtn1 setTitle:@"点此开启侧滑" forState:UIControlStateNormal];
    [descBtn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [descBtn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [descBtn1 sizeToFit];
    descBtn1.center = CGPointMake(self.view.center.x, self.view.center.y + 160);
    [self.view addSubview:descBtn1];
}

- (void)btnAction:(UIButton *)sender {
    [self p_openPanBackThisVcInApp:sender.tag == 100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
