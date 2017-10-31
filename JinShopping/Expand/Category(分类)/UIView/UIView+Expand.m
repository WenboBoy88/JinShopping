//
//  UIView+Expand.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/17.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "UIView+Expand.h"

@implementation UIView (Expand)

+ (UIView *)creatNoDataViewWithFrame:(CGRect)frame content:(NSString *)content{
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2.0, frame.size.height/2.0-120, 100, 100)];
    imageView.image = [UIImage imageNamed:@"ic_blank_collection"];
    [view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+10.0, frame.size.width, 40)];
    label.text = [NSString stringWithFormat:@"暂无%@!", content];
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    return view;
}

@end
