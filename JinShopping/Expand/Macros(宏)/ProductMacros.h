//
//  ProductMacros_h
//  JinShopping
//
//  Created by 张文博 on 2017/10/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#ifndef ProductMacros_h
#define ProductMacros_h

// 使用的颜色
#define COLOR_MAIN_BG        RGB_16(0xf8f8f8)
#define COLOR_MAIN_COLOR     RGB_16(0x06c1ae)
#define COLOR_MAIN_RED       RGB_16(0xf84b4c)
#define COLOR_MAIN_YELLOW    RGB_16(0xfab909)
#define COLOR_MAIN_GREEN     RGB_16(0x5eb95e)


// 首页操作按钮的tag
typedef NS_ENUM(NSInteger, HomeOperationTag) {
    Home_FastStore,
    Home_ShoppingMall,
    Home_FoodIndustry,
    Home_IntegralMall,
    Home_Bespeak,
    Home_Coupon,
    Home_Dating,
    Home_WineShop,
    Home_NearbyShop,
    Home_LifePayment
};


#endif /* ProductMacros_h */
