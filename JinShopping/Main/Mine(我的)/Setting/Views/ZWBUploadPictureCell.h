//
//  ZWBUploadPictureCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBUploadPictureCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

- (void)setTitle:(NSString *)title showImage:(UIImage *)image imageUrl:(NSString *)imageUrl placeholdImageName:(NSString *)placeholdImageName;


@end
