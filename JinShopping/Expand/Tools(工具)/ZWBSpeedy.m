//
//  ZWBSpeedy.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBSpeedy.h"

@implementation ZWBSpeedy

+ (id)zwb_chageControlCircularView:(id)anyControl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)borderColor canMasksToBounds:(BOOL)can {
    
    CALayer *icon_layer = [anyControl layer];
    [icon_layer setCornerRadius:radius];
    [icon_layer setBorderWidth:width];
    [icon_layer setBorderColor:[borderColor CGColor]];
    [icon_layer setMasksToBounds:can];
    
    return anyControl;
}

+ (id)zwb_setSomeOneChangeColor:(UILabel *)label selectArray:(NSArray *)arrray changeColor:(UIColor *)color {
    if (label.text.length == 0) {
        return 0;
    }
    int i;
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:label.text];
    for (i = 0; i < label.text.length; i ++) {
        NSString *a = [label.text substringWithRange:NSMakeRange(i, 1)];
        NSArray *number = arrray;
        if ([number containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:color} range:NSMakeRange(i, 1)];
        }
    }
    label.attributedText = attributeString;
    return label;
}


#pragma mark - 下划线
+ (void)zwb_setupAcrossPartingLineWith:(UIView *)view lineColor:(UIColor *)color {
    
    UIView *cellAcrossPartingLine = [[UIView alloc] init];
    cellAcrossPartingLine.backgroundColor = color;
    [view addSubview:cellAcrossPartingLine];
    
    cellAcrossPartingLine.sd_layout
    .leftEqualToView(view)
    .bottomEqualToView(view)
    .widthRatioToView(view, 1.0)
    .heightIs(1);
}

#pragma mark - 竖线
+ (void)zwb_setupLongLineWith:(UIView *)view color:(UIColor *)color heightRatio:(CGFloat)ratio {
    if (ratio == 0) { // 默认1
        ratio = 1;
    }
    UIView *cellLongLine = [[UIView alloc] init];
    cellLongLine.backgroundColor = color;
    [view addSubview:cellLongLine];
    
    cellLongLine.sd_layout
    .rightEqualToView(view)
    .centerYEqualToView(view)
    .widthIs(1)
    .heightIs(view.zwb_height * ratio);
}

#pragma mark - 设置圆角
+ (void)zwb_setupBezierPathCircularLayerWith:(UIView *)view radiusSize:(CGSize)size {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopLeft |UIRectCornerTopRight cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

#pragma mark - 首行缩进
+ (void)zwb_setupLabel:(UILabel *)label content:(NSString *)content indentationFortheFirstLineWith:(CGFloat)emptylen {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.firstLineHeadIndent = emptylen;//首行缩进
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:content attributes:@{NSParagraphStyleAttributeName:paraStyle}];
    
    label.attributedText = attrText;
}

#pragma mark - 字符串加星处理
+ (NSString *)zwb_encryptionDisplayMessageWith:(NSString *)content withFirstIndex:(NSInteger)index {
    if (index <= 0) {
        index = 2;
    } else if (index + 1 > content.length) {
        index--;
    }
    return [NSString stringWithFormat:@"%@***%@",[content substringToIndex:index],[content substringFromIndex:content.length - 1]];
}

#pragma mark - 图片转base64编码
+ (NSString *)imageToBase64Str:(UIImage *)image; {
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

#pragma mark - base64图片转编码
+ (UIImage *)base64StrToUIImage:(NSString *)encodedImageStr {
    NSData *decodedImageData = [[NSData alloc] initWithBase64EncodedString:encodedImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
    return decodedImage;
}


@end
