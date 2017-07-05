
#ifndef PublicDefine_h
#define PublicDefine_h

//返回安全的字符串
#define kSafeString(str) str.length > 0 ? str : @""

//状态栏高度
#define STATUS_BAR_HEIGHT 20
//NavBar高度
#define NAVIGATION_BAR_HEIGHT 44
//状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

#define CONTENT_HEIGHT (kScreenHeight - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

//屏幕分辨率
#define SCREEN_RESOLUTION (kScreenWidth * kScreenHeight * ([UIScreen mainScreen].scale))

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)


#define kUIToneBackgroundColor UIColorFromHex(0x00bd8c) //UI整体背景色调 与文字颜色一一对应
#define kUIToneTextColor UIColorFromHex(0xffffff) //UI整体文字色调 与背景颜色对应
#define kStatusBarStyle UIStatusBarStyleLightContent //状态栏样式
#define kViewBackgroundColor UIColorFromHex(0xf5f5f5) //界面View背景颜色

#endif /* PublicDefine_h */
