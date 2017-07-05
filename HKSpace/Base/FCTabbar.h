//
//  FCTabbar.h
//  HKSpace
//
//  Created by FC on 17/4/9.
//  Copyright © 2017年 FC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCTabbar : UIView
/*
 bgImageName和isUse只能有一个使用另一个必为nil，用来设置整个Tabbar背景色
 */
-(void)creatFCTabbarWithBackGroundImage:(NSString *)bgImageName orUseBackGroundView:(BOOL)isUse ifUseBGViewWithColor:(UIColor *)bgViewColor withViewControllerArray:(NSArray *)controllerArray withNormalImageArray:(NSArray *)normalImageArray withSelectImageArray:(NSArray *)selectImageArray withTabbarItemTitleArray:(NSArray *)itemTitleArray withTarget:(id)currentTarget withSelector:(SEL)selector;
@end
