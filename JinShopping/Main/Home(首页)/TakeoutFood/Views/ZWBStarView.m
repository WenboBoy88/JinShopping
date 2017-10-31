//
//  ZWBStarView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/25.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBStarView.h"

@interface ZWBStarView ()

@property (nonatomic, assign) BOOL canAddStar;

@property (nonatomic, strong) UIImageView *img_star1;
@property (nonatomic, strong) UIImageView *img_star2;
@property (nonatomic, strong) UIImageView *img_star3;
@property (nonatomic, strong) UIImageView *img_star4;
@property (nonatomic, strong) UIImageView *img_star5;

@end

@implementation ZWBStarView

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.operation = NO;
    [self creatStarImage];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 默认不能编辑
        self.operation = NO;

        [self creatStarImage];
    }
    return self;
}

#pragma mark - 创建视图
- (void)creatStarImage {
    
    CGFloat width = (self.zwb_width - 4 * Padding - 10 ) / 5 > self.zwb_height ? self.zwb_height : (self.zwb_width - 4 * Padding - 10 ) / 5;
    NSLog(@"%f", width);
    NSLog(@"%f---%f", self.zwb_width, self.zwb_height);
    self.img_star1 = [[UIImageView alloc] init];
    self.img_star1.image = IMAGE(@"waimai_unStar");
    self.img_star1.layer.masksToBounds = YES;
    
    self.img_star2 = [[UIImageView alloc] init];
    self.img_star2.image = IMAGE(@"waimai_unStar");
    self.img_star2.layer.masksToBounds = YES;
    
    self.img_star3 = [[UIImageView alloc] init];
    self.img_star3.image = IMAGE(@"waimai_unStar");
    self.img_star3.layer.masksToBounds = YES;
    
    self.img_star4 = [[UIImageView alloc] init];
    self.img_star4.image = IMAGE(@"waimai_unStar");
    self.img_star4.layer.masksToBounds = YES;
    
    self.img_star5 = [[UIImageView alloc] init];
    self.img_star5.image = IMAGE(@"waimai_unStar");
    self.img_star5.layer.masksToBounds = YES;
    
    [self sd_addSubviews:@[self.img_star1, self.img_star2, self.img_star3, self.img_star4, self.img_star5]];
    
    self.img_star1.sd_layout.heightEqualToWidth();
    self.img_star2.sd_layout.heightEqualToWidth();
    self.img_star3.sd_layout.heightEqualToWidth();
    self.img_star4.sd_layout.heightEqualToWidth();
    self.img_star5.sd_layout.heightEqualToWidth();
    
    [self setupAutoMarginFlowItems:@[self.img_star1, self.img_star2, self.img_star3, self.img_star4, self.img_star5] withPerRowItemsCount:5 itemWidth:25 verticalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:5];
}

- (void)setOperation:(BOOL)operation {
    _operation = operation;
    
    self.userInteractionEnabled = operation;
}

- (void)setLevel:(CGFloat)level {
    _level = level;
    if (level == 0) {
        
    } else if (level == 0.5) {
        
    } else if (level == 1) {
        
    } else if (level == 1.5) {
        
    } else if (level == 2) {
        
    } else if (level == 2.5) {
        
    } else if (level == 3) {
        
    } else if (level == 3.5) {
        
    } else if (level == 4) {
        
    } else if (level == 4.5) {
        
    } else if (level == 5) {
        
    }

}

//- (void)setCount:(NSInteger)count {
//    _count = count;
//    switch (count) {
//        case 1: {
//            self.img_star1.image = IMAGE(@"xingxing");
//        }
//            break;
//        case 2: {
//            self.img_star1.image = IMAGE(@"xingxing");
//            self.img_star2.image = IMAGE(@"xingxing");
//        }
//            break;
//        case 3: {
//            self.img_star1.image = IMAGE(@"xingxing");
//            self.img_star2.image = IMAGE(@"xingxing");
//            self.img_star3.image = IMAGE(@"xingxing");
//        }
//            break;
//        case 4: {
//            self.img_star1.image = IMAGE(@"xingxing");
//            self.img_star2.image = IMAGE(@"xingxing");
//            self.img_star3.image = IMAGE(@"xingxing");
//            self.img_star4.image = IMAGE(@"xingxing");
//        }
//            break;
//        case 5: {
//            self.img_star1.image = IMAGE(@"xingxing");
//            self.img_star2.image = IMAGE(@"xingxing");
//            self.img_star3.image = IMAGE(@"xingxing");
//            self.img_star4.image = IMAGE(@"xingxing");
//            self.img_star5.image = IMAGE(@"xingxing");
//        }
//            break;
//        default:
//            break;
//    }
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if((point.x > 0 && point.x < self.frame.size.width) && (point.y > 0 && point.y < self.frame.size.height)){
        self.canAddStar = YES;
        [self changeStarForegroundViewWithPoint:point];
    } else {
        self.canAddStar = NO;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.canAddStar){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        [self changeStarForegroundViewWithPoint:point];
    }
    
    return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.canAddStar){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        [self changeStarForegroundViewWithPoint:point];
    }
    self.canAddStar = NO;
    
    if (self.starLevelBlock) {
        self.starLevelBlock(self.level, self.indexPath);
    }
    
    return;
}


- (void)changeStarForegroundViewWithPoint:(CGPoint)point{
    
    NSInteger count = 0;
    count = count + [self changeImg:point.x image:self.img_star1];
    count = count + [self changeImg:point.x image:self.img_star2];
    count = count + [self changeImg:point.x image:self.img_star3];
    count = count + [self changeImg:point.x image:self.img_star4];
    count = count + [self changeImg:point.x image:self.img_star5];
    
//    self.count = count;
}

- (NSInteger)changeImg:(float)x image:(UIImageView *)img {
#if 0
    if (x > img.frame.origin.x + img.frame.size.width / 2){
        [img setImage:[UIImage imageNamed:@"StarSelected"]];
        return 1;
    } else if (x > img.frame.origin.x) {
        [img setImage:[UIImage imageNamed:@"StarSelectHeaf"]];
        return 0;
    } else {
        [img setImage:[UIImage imageNamed:@"StarUnSelect"]];
        return 0;
    }
#else
    if (x > img.frame.origin.x) {
        [img setImage:[UIImage imageNamed:@"StarSelected"]];
        return 1;
    } else {
        [img setImage:[UIImage imageNamed:@"StarUnSelect"]];
        return 0;
    }
    
#endif
}


@end
