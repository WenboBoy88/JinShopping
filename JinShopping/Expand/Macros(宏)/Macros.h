//
//  Macros.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


//中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
#define FONT_SYSTEM(x) [UIFont systemFontOfSize:x]

#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"
#define PFR_FONT(x) [UIFont fontWithName:PFR size:x];


//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define ScreenWidthRatio  (SCREEN_WIDTH / 320.0)
#define ScreenHeightRatio (SCREEN_HEIGHT / 568.0)
#define AdaptedWidth(x)  ceilf((x) * ScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * ScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000


//----------------------ABOUT SCREEN & SIZE 屏幕&尺寸 ----------------------------
/**
 iPad Air            {{0, 0}, {768, 1024}}
 iphone4s            {{0, 0}, {320, 480}}      640*960
 iphone5     5s      {{0, 0}, {320, 568}}      640*1136
 iphone6     6s      {{0, 0}, {375, 667}}      750*1334
 iphone6Plus 6sPlus  {{0, 0}, {414, 736}}      1080*1920
 Apple Watch 1.65inches(英寸) 320*640
 */

// MainScreen Height&Width
#define SCREEN_HEIGHT      [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH       [[UIScreen mainScreen] bounds].size.width
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

//获取View的属性
#define GetViewWidth(view)  view.frame.size.width
#define GetViewHeight(view) view.frame.size.height
#define GetViewX(view)      view.frame.origin.x
#define GetViewY(view)      view.frame.origin.y

//App版本号
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//判断是否 Retina屏、设备是否iPhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define isRetina_Scale ([[UIScreen mainScreen] scale] >= 2.0)

/** 判断是否为iPhone */
#define isPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 判断是否是iPad */
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是否为iPod */
#define isPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])


/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define isIPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 6s 7 分辨率375x667，像素750x1334，@2x */
#define isIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 6s Plus 7 Plus 分辨率414x736，像素1242x2208，@3x */
#define isIPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/** 获取当前的语言*/
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//Get the OS version.       判断操作系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/** 是否为iOS6 */
#define isIOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? YES : NO)
/** 是否为iOS7 */
#define isIOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)
/** 是否为iOS8 */
#define isIOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)
/** 是否为iOS9 */
#define isIOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)
/** 是否为iOS10 */
#define isIOS10 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) ? YES : NO)
/** 是否为iOS11 */
#define isIOS11 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) ? YES : NO)

//相对iphone6 屏幕比 宏定义屏幕缩放
#define SCREEN_HEIGHT_SCALE_IOS6    [UIScreen mainScreen].bounds.size.height / 667.0f
#define SCREEN_WIDTH_SCALE_IOS6    [UIScreen mainScreen].bounds.size.width / 375.0f


// -----------------------------------------------------------------
//judge the simulator or hardware device        判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device

#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator

#endif

// -----------------------------------------------------------------
//宏定义导航栏颜色
#define NaviBarTintColor [UIColor colorWithRed:45.0/255.0 green:185.0/255.0 blue:165.0/255.0 alpha:1.0]
#define TabBarH         49.0f
#define StatusBarH      20.0f
#define NavigationBarH  44.0f


//一些缩写
#define kAppDelegate        [[UIApplication sharedApplication] delegate]
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]


//弱引用/强引用  可配对引用在外面用MPWeakSelf(self)，block用MPStrongSelf(self)  也可以单独引用在外面用MPWeakSelf(self) block里面用weakself
//#define WeakCell(type)  __weak typeof(&*type) weakCell = type
#define WeakSelf(type)  __weak typeof(type)   weakSelf = type
#define Strongself(type)  __strong typeof(type) type = weak##type


//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//edit the plist
#define PLIST_TICKET_INFO_EDIT [NSHomeDirectory() stringByAppendingString:@"/Documents/data.plist"]
// 空字符串
#define kEmptyStr @""
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//宏定义三目运算符
#define THREE_ITEM_OPERATION(str) str ? str : @""
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || [array count] == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0)) ? YES : NO

//---------------------------------------------------------------

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

/** 快速查询一段代码的执行时间 */
/** 用法
 TICK
 do your work here
 TOCK
 */
#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);

/** 默认的时间间隔*/
#define DELAYSECOND 1.5

//---------------------------------------------------------------

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)


//---------------------------------------------------------------

/** 间隔*/
#define Padding  10
#define MAX_WIDTH(PADING)        (SCREEN_WIDTH - 2 * PADING)
#define kLineHeight (1 / [UIScreen mainScreen].scale)


//---------------------------------------------------------------

//设置 view 圆角和边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]



//----------------------ABOUT COLOR 颜色相关 ----------------------------

//带有RGBA的颜色设置
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// rgb颜色转换（16进制->10进制）
#define RGB_16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define COLOR_BG                RGB_16(0xeeeeee)
#define COLOR_CLEAR             [UIColor clearColor]
#define COLOR_SEPERATOR         RGBA(234,237,240, 1.0)
#define COLOR_333               RGB_16(0x333333)    //51
#define COLOR_666               RGB_16(0x666666)    //102
#define COLOR_888               RGB_16(0x888888)    //136
#define COLOR_999               RGB_16(0x999999)    //153
#define COLOR_DDD               RGB_16(0xdddddd)    //153
#define COLOR_PLACEHOLD         RGB_16(0xc5c5c5)    //197
#define COLOR_SEPARATE_LINE     RGB_16(0xC8C8C8)    //200
#define COLOR_RED               RGB_16(0xff5400)    //红色
#define COLOR_BLUE              RGB_16(0x41CEF2)    //蓝色
#define COLOR_GROUPTABLE        RGB_16(0xefefef)    //浅灰
#define COLOR_GRAY              RGB_16(0xababab)    //深灰
#define COLOR_GREEN             RGB_16(0x31d8ab)    //绿色
#define COLOR_YELLOW            RGB_16(0xffa200)    //黄色
#define COLOR_CYAN              RGB_16(0x00FFFF)    //亮色
#define COLOR_LIGHTGREEN        RGB_16(0x5eb95e)    //浅绿
#define COLOR_LIGHTGRAY         RGBA(220, 220, 220, 0.4)    //淡灰
#define COLOR_WHITE             RGBA(255, 255, 255, 1.0)    //白色
#define COLOR_BLACK             RGBA(0, 0, 0, 1.0)    //白色

//----------------------ABOUT IMAGE 图片 ----------------------------
//LOAD LOCAL IMAGE FILE     读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
//DEFINE IMAGE      定义UIImage对象
#define IMAGE(filename) [UIImage imageNamed:filename]
//DEFINE IMAGE      定义UIImage对象    imgView.image = ImageNamed(@"Default.png");
#define ImageNamed(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]



//---------------------------------------------------------------

/** the saving objects      存储对象 */
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

#define UserDefaultSetBoolForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setBool:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/** get the saved objects       获得存储的对象 */
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]
#define UserDefaultBoolForKey(__KEY__)    [[NSUserDefaults standardUserDefaults] boolForKey:__KEY__]

/** delete objects      删除对象 */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}


//---------------------------------------------------------------

#define TableViewCellDequeueInit(__INDETIFIER__) [tableView dequeueReusableCellWithIdentifier:(__INDETIFIER__)];

#define TableViewCellDequeue(__CELL__,__CELLCLASS__,__INDETIFIER__) \
{\
if (__CELL__ == nil) {\
__CELL__ = [[__CELLCLASS__ alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:__INDETIFIER__];\
}\
}


//---------------------------------------------------------------

//GCD
#define GCDWithGlobal(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDWithMain(block) dispatch_async(dispatch_get_main_queue(),block)

// 在Main线程上运行
#define DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//在Global Queue上运行
#define DISPATCH_ON_GLOBAL_QUEUE_HIGH(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_LOW(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_BACKGROUND(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), globalQueueBlocl);

//Global Queue
//DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(^{

//异步耗时任务
//})



//---------------------------------------------------------------

#define SYNTHESIZE_SINGLETON_FOR_CLASSH(classname) \
+ (instancetype)shared##classname; \


//单例化 一个类
#define SYNTHESIZE_SINGLETON_FOR_CLASSM(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##classname = [[self alloc] init]; \
}); \
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#endif /* Macros_h */
