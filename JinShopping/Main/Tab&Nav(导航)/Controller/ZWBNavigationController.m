//
//  ZWBNavigationController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/16.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBNavigationController.h"

#define kBarTintColor      RGBA(6, 193, 174, 1.0)  //导航背景色
#define kTintColor         COLOR_333               //字体颜色
#define kTitleColor        [UIColor whiteColor]    //字体颜色
#define kBarItemTextColor  [UIColor whiteColor]    //按钮颜色
#define kBarItemTextFont   14                      //字体大小

@interface ZWBNavigationController ()

@end

@implementation ZWBNavigationController

+ (void)initialize {
    
    // 设置为不透明
    [[UINavigationBar appearance] setTranslucent:YES];
    
    // 设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = kBarTintColor;
    [UINavigationBar appearance].tintColor = COLOR_CLEAR;
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR_WHITE, NSForegroundColorAttributeName, FONT_SYSTEM(18.0f), NSFontAttributeName, nil]];
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kTitleColor;
    textAttrs[NSFontAttributeName] = FONT_SYSTEM(15.0f);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:kBarItemTextFont];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
//    disableTextAttrs[NSForegroundColorAttributeName] = kBarItemTextColor;
//    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:kBarItemTextFont];
//    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - <返回>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >= 1) {
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
        //影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //跳转
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 点击
- (void)backClick {
    
    [self popViewControllerAnimated:YES];
}

//#pragma mark - 导航栏上状态栏为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/**
 如果单单只是想控制所有界面上方的BarStyle可以打开上面的代码打开这行代码并且在那个界面重写上面的代码
 
 @return UIViewController
 */
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
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
