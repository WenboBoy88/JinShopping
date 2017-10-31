//
//  ZWBProgressView.m
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 17/5/4.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBProgressView.h"


#define KProgressBorderWidth 2.0f
#define KProgressPadding 1.0f
#define KProgressColor [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1]

@interface ZWBProgressView ()
{
    CGFloat _widthRatio;
    UIView *_bottomView;
    UIView *_progressView;
}

@property (nonatomic, assign) CGFloat widthRatio;
@property (nonatomic, strong) UIView *progressView;
//@property(nonatomic, strong) dispatch_source_t timer;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ZWBProgressView

- (instancetype)init {
    if (self = [super init]) {
        
        [self creatUI];

        [self setupInfo];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
        
        [self setupInfo];
        
        [self initTimer];;
    }
    return self;
}

- (void)setupInfo {
    
    self.time = 0.40;
    self.progress = 0.00;
    self.widthRatio = 0.00;
}

- (void)creatUI {
    UIView *progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.height)];
    progressView.backgroundColor = COLOR_LIGHTGREEN;
    progressView.layer.masksToBounds = YES;
    [self addSubview:progressView];
    self.progressView = progressView;
}

- (void)initTimer {
    if (!self.timer) {
        if (@available(iOS 10.0, *)) {
            self.progress = 0.0f;
            WeakSelf(self);
            self.timer = [NSTimer scheduledTimerWithTimeInterval:self.time repeats:YES block:^(NSTimer * _Nonnull timer) {
                [weakSelf startLoadProgress];
            }];
        } else {
            // Fallback on earlier versions
            self.timer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(startRunTimer) userInfo:nil repeats:YES];

        }
        [self pauseTimer];
    }
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.widthRatio = progress;
    
    [UIView animateWithDuration:self.time animations:^{
        self.hidden = NO;
        CGRect frame = self.progressView.frame;
        frame.size.width = SCREEN_WIDTH * self.widthRatio;
        self.progressView.frame = frame;
        [self.progressView layoutSubviews];
    } completion:^(BOOL finished) {
        if (progress == 1.0f) {
            self.hidden = YES;
            _progress = 0.0;
            self.progressView.frame = CGRectMake(0, 0, 0, 3);
        }

    }];
}

- (void)layoutSubviews {
    NSLog(@"progressView frame = %@", NSStringFromCGRect(self.progressView.frame));
}

- (void)startRunTimer {

    if (![self.timer isValid]) {
        
        return ;
    }
    
    
    // 启动定时器
    [self.timer setFireDate:[NSDate distantPast]];
}

- (void)endTimer {
    
    if (![self.timer isValid]) {
        return ;
    }
    self.progress = 1.0f;
    
//    self.timer ? [self.timer invalidate] : nil;
//    self.timer = nil;
    
    // 暂停定时器的功能
    [self pauseTimer];
}

- (void)pauseTimer {
    if (![self.timer isValid]) {
        return ;
    }

    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer {
    
    
    [self.timer setFireDate:[NSDate date]];

}

- (void)dealloc {
    NSLog(@"dealloc");
    self.timer ? [self.timer invalidate] : nil;
    self.timer = nil;
}

- (void)startLoadProgress {
    self.progress += 0.05;
    NSLog(@"%lf", self.progress);
    if (self.progress >= 0.80) { // 大于0.8就暂停加载功能
        
        [self pauseTimer];
        return ;
    }
}


@end
