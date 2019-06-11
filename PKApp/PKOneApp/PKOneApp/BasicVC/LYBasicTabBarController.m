//
//  LYBasicTabBarController.m
//  OneApp
//
//  Created by leiyong on 2019/4/30.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "LYBasicTabBarController.h"
#import "BasicNavigationControler.h"
#import "PKluckyController.h"
#import "PKfavoriteController.h"
#import "PKpredicController.h"
#import "PKsettingController.h"
@implementation LYBasicTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self setupOneChildViewWithView:[[PKluckyController alloc]init] title:@"今日运气" image:@"tabbar_first" highimage:@"tabbar_first_selected"];
    [self setupOneChildViewWithView:[[PKpredicController alloc]init] title:@"预测" image:@"tabbar_second" highimage:@"tabbar_second_selected"];
    [self setupOneChildViewWithView:[[PKfavoriteController alloc]init] title:@"星文" image:@"tabbar_explaination" highimage:@"tabbar_explaination_selected"];
    [self setupOneChildViewWithView:[[PKsettingController alloc]init] title:@"设置" image:@"tabbar_last" highimage:@"tabbar_last_selected"];
    
}

#pragma  mark - 设置一个自控制器
- (void)setupOneChildViewWithView:(UIViewController *)view title:(NSString *)title image:(NSString *)image highimage:(NSString *)highimage
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[UIImage imageNamed:image]
                                               selectedImage:[[UIImage imageNamed:highimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    //添加导航控制器
    BasicNavigationControler *vc = [[BasicNavigationControler alloc] initWithRootViewController:view];
    vc.tabBarItem = item;
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];

    [self addChildViewController:vc];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
