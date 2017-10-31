//
//  ZWBUploadPictureCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBUploadPictureCell.h"

@implementation ZWBUploadPictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setTitle:(NSString *)title showImage:(UIImage *)image imageUrl:(NSString *)imageUrl placeholdImageName:(NSString *)placeholdImageName {
    
    self.titleLabel.text = title;
    // 如果图片存在  直接显示
    if (image) {
        self.imageView.image = image;
    } else { // 图片不存在
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:IMAGE(placeholdImageName)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
