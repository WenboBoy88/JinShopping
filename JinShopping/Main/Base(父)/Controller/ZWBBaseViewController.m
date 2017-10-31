//
//  ZWBBaseViewController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/16.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseViewController.h"

@interface ZWBBaseViewController ()

@end

@implementation ZWBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 初始化数据
    [self setUpBase];
}

#pragma mark - initialize
- (void)setUpBase {
    
    self.view.backgroundColor = COLOR_MAIN_BG;

    // 自定义Pop返回
    [self gesturePop];
    //  实时监控网络情况
    [self hostReachability];

    // 基础设施
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.opaque = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;

}


//增加 左右按钮
- (void)addBarButtonItemWithTitle:(NSString *)title textColor:(UIColor *)color target:(id)target action:(SEL)action isLeft:(BOOL)isLeft {
    
    UIButton *button = [ZWBFactory creatButtonWithFrame:CGRectMake(0, 0, 50, 30) bgColor:nil textColor:color target:target sel:action tag:0 image:@"buttonbar_action" title:title];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

#pragma mark - Private Method
- (void)gesturePop {
    // 在自定义leftBarButtonItem后添加下面代码就可以完美解决返回手势无效的情况
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
    NSArray *gestureArray = self.navigationController.view.gestureRecognizers;
    //当是侧滑手势的时候设置scrollview需要此手势失效才生效即可
    for (UIGestureRecognizer *gesture in gestureArray) {
        if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
            
            for (UIView *sub in self.view.subviews) {
                if ([sub isKindOfClass:[UIScrollView class]]) {
                    UIScrollView *sc = (UIScrollView *)sub;
                    [sc.panGestureRecognizer requireGestureRecognizerToFail:gesture];
                }
            }
        }
    }
}



#pragma mark - 监听网络状态
- (void)hostReachability {
    Reachability *hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netStatusChange:) name:kReachabilityChangedNotification object:nil];
    [hostReach startNotifier];
}

/**
 *  通知监听回调网络状态发送改变 系统会发出一个kReachabilityChangedNotification通知，然后会触发此回调方法
 */
- (void)netStatusChange:(NSNotification *)noti {
    
    Reachability *curReach = [noti object];
    
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    
    NSLog(@"-----%@",noti.userInfo);
    //判断网络状态
    switch (curReach.currentReachabilityStatus) {
        case NotReachable:
            [MBProgressHUD showAutoMessage:@"暂无网络"];
            NSLog(@"暂无网络");
            break;
        case ReachableViaWiFi:
            NSLog(@"wifi上网");
            break;
        case ReachableViaWWAN:
            NSLog(@"手机上网");
            break;
        default:
            break;
    }
    
}

#pragma 设置StatusBar为白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 销毁
- (void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
