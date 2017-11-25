//
//  TabBar.m
//  GPGaming
//
//  Created by yzx on 15/5/19.
//  Copyright (c) 2015年 weipei. All rights reserved.
//

#import "GPTabBar.h"
#import "GPTabBarButton.h"

#define GPColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]


@interface GPTabBar ()

/**
 *  记录当前选中的按钮
 */
@property (nonatomic, weak) GPTabBarButton *selectedButton;

/**
 * 判断模糊组件是否已经Insert
 */
@property (nonatomic, assign) BOOL isInsert;

@end


@implementation GPTabBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTabBarButton:) name:@"AppConfigRequestDone" object:nil];
    }
    return self;
}

- (void)refreshTabBarButton:(NSNotification *)noti {
    
    NSDictionary *configData = noti.userInfo[@"body"][@"enabled_module"];
    BOOL showLottery = [configData[@"lottery"] boolValue];
    
    [[NSUserDefaults standardUserDefaults] setBool:showLottery forKey:@"lottery"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *activityKey = @"activityNew";
    BOOL activityNew = [[NSUserDefaults standardUserDefaults] boolForKey:activityKey];
    if (!activityNew) {
        GPTabBarButton *activityButton;
        for (id views in self.subviews) {
            if ([views isKindOfClass:[GPTabBarButton class]]) {
                GPTabBarButton *button =  (GPTabBarButton *)views;
                if ([button.item.title isEqualToString:@"活动"] || [button.item.title isEqualToString:@"Event"]) {
                    activityButton = views;
                }
            }
        }
        if (showLottery) {
            activityButton.redLabel.hidden = NO;
        }else{
            activityButton.redLabel.hidden = YES;
        }
        
    }
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item {
    // 1.创建按钮
    GPTabBarButton *button = [[GPTabBarButton alloc] init];
    [self addSubview:button];

    // 2.设置数据
    button.item = item;

    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName {
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(GPTabBarButton *)button {
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:(short)self.selectedButton.tag to:(short)button.tag];
    }
    
    if (!button.redLabel.hidden) {
        button.redLabel.hidden = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"activityNew"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if (self.isInsert) {
        return;
    }

    // 按钮的frame数据
    CGFloat buttonH = 49;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;

    for (int index = 0; index < self.subviews.count; index++) {
        // 1.取出按钮
        GPTabBarButton *button = self.subviews[index];

        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);

        // 3.绑定tag
        button.backgroundColor = [UIColor clearColor];
        button.tag = index;
    }

    // 添加模糊效果
    UIToolbar *toobar = [[UIToolbar alloc] init];
    toobar.barStyle = UIBarStyleDefault;
    toobar.translucent = YES;
    toobar.frame = self.bounds;
    [self insertSubview:toobar atIndex:0];
    self.isInsert = YES;
}

- (void)selectIndex:(NSInteger)index {
    BOOL hideGuessModule = [[[NSUserDefaults standardUserDefaults] valueForKey:@"hideGuessModule"] boolValue];
    if (hideGuessModule && index >= 4) {
        index = index - 1;
    }
    GPTabBarButton *button = self.subviews[index];
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

@end
