//
//  GPViewController.m
//  GPNavigationController
//
//  Created by ziyue92 on 08/26/2017.
//  Copyright (c) 2017 ziyue92. All rights reserved.
//

#import "ExampleViewController.h"
#import "DetailViewController.h"
@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *params = @{Nav_Title:@"这是自定义导航栏",Nav_Right:@"下一页"}.mutableCopy;
    [self p_setTopTitleDetail:params];

}

- (void)p_topRightBtnClick {
    [self.navigationController pushViewController:[DetailViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
