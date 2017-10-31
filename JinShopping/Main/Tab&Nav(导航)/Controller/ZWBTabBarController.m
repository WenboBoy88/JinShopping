//
//  ZWBTabBarController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/16.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTabBarController.h"

// Controllers
#import "ZWBNavigationController.h"
#import "ZWBBaseViewController.h"
// Models

// Views
#import "ZWBTabBar.h"

// Categories

// Others

// Vendors

// Macros

@interface ZWBTabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZWBTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;
    
    [self setUpTabBar];

    [self addDcChildViewContorller];
}

#pragma mark - 更换系统tabbar
-(void)setUpTabBar {
    ZWBTabBar *tabBar = [[ZWBTabBar alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    //KVC把系统换成自定义
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加子控制器
- (void)addDcChildViewContorller {
    NSArray *childArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ZWBTabBar" ofType:@"plist"]];
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *child, NSUInteger idx, BOOL * _Nonnull stop) {
        ZWBBaseViewController *vc = [NSClassFromString(child[@"controller"]) new];
        vc.navigationItem.title = child[@"title"];
        ZWBNavigationController *nav = [[ZWBNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem.title = child[@"title"];
        // 设置子控制器的图片
        nav.tabBarItem.image = [[UIImage imageNamed:child[@"normalImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:child[@"selectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 设置未选中文字的样式
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = COLOR_BLACK;
        [nav.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        // 设置选中文字的样式
        NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
        selectTextAttrs[NSForegroundColorAttributeName] = COLOR_MAIN_COLOR;
        [nav.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
        //默认不显示标题 - 图片居中
//        CGFloat offset = 5.0;
//        nav.tabBarItem.imageInsets = UIEdgeInsetsMake(offset*2, 0, -offset, 0);
//        nav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);

        [self addChildViewController:nav];
    }];
}



#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
}


- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}

#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
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
