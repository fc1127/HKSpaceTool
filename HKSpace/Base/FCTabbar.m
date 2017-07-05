//
//  FCTabbar.m
//  HKSpace
//
//  Created by FC on 17/4/9.
//  Copyright © 2017年 FC. All rights reserved.
//

#import "FCTabbar.h"

@implementation FCTabbar

-(void)creatFCTabbarWithBackGroundImage:(NSString *)bgImageName orUseBackGroundView:(BOOL)isUse ifUseBGViewWithColor:(UIColor *)bgViewColor withViewControllerArray:(NSArray *)controllerArray withNormalImageArray:(NSArray *)normalImageArray withSelectImageArray:(NSArray *)selectImageArray withTabbarItemTitleArray:(NSArray *)itemTitleArray withTarget:(id)currentTarget withSelector:(SEL)selector
{
    //创建tabbar背景色，可用图片背景也可用纯色view设置背景
    [self creatFCTabbarWithBackGroundImage:bgImageName orUseBackGroundView:isUse ifUseBGViewWithColor:bgViewColor];
    //创建选择器
    for (int i=0; i<controllerArray.count + 1; i++) {
        if (i != 2) {
            [self creatFCTabbarItemwithViewControllerArray:(NSArray *)controllerArray withNormalImageArray:normalImageArray withSelectImageArray:selectImageArray withTabbarItemTitleArray:(NSArray *)itemTitleArray withIndex:i > 2 ? i - 1 : i withTarget:currentTarget withSelector:selector];
        }
    }
    
}

-(void)creatFCTabbarWithBackGroundImage:(NSString *)bgImageName orUseBackGroundView:(BOOL)isUse ifUseBGViewWithColor:(UIColor *)bgViewColor
{
    if (bgImageName!=nil) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        imageView.image=[UIImage imageNamed:bgImageName];
        [self addSubview:imageView];
    }
    else
    {
        UILabel *view=[[UILabel alloc]initWithFrame:self.bounds];
        view.backgroundColor=bgViewColor;
        [self addSubview:view];
    }
}
-(void)creatFCTabbarItemwithViewControllerArray:(NSArray *)controllerArray withNormalImageArray:(NSArray *)normalImageArray withSelectImageArray:(NSArray *)selectImageArray withTabbarItemTitleArray:(NSArray *)itemTitleArray withIndex:(NSUInteger)currentIndex withTarget:(id)currentTarget withSelector:(SEL)selector
{
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake((self.bounds.size.width/(controllerArray.count + 1))*(currentIndex >= 2 ? currentIndex + 1 : currentIndex), 0, self.bounds.size.width/(controllerArray.count + 1), self.bounds.size.height)];
    if (currentIndex==0) {
        //        bgView.backgroundColor=[UIColor grayColor];
    }
    else
        bgView.backgroundColor=[UIColor clearColor];
    [self addSubview:bgView];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    imageView.center=CGPointMake(self.bounds.size.width/(controllerArray.count + 1)/2, self.bounds.size.height/2-10);
    imageView.center=CGPointMake(self.bounds.size.width/(controllerArray.count + 1)/2, -8);

    imageView.tag=currentIndex;
    imageView.userInteractionEnabled=YES;
    if (currentIndex==0) {
        imageView.image=[UIImage imageNamed:selectImageArray[currentIndex]];
    }
    else
        imageView.image=[UIImage imageNamed:normalImageArray[currentIndex]];
    [bgView addSubview:imageView];
    
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, imageView.center.y+20/2, self.bounds.size.width/(controllerArray.count + 1), self.bounds.size.height-(imageView.center.y+20/2))];
    label.text=itemTitleArray[currentIndex];
    //    label.tag=currentIndex;
    if (currentIndex==0) {
        label.textColor=[UIColor purpleColor];//tabbar标题字体颜色
    }
    else
        label.textColor=[UIColor darkGrayColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:18];
    [bgView addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height);
    button.tag=currentIndex;
    [button addTarget:currentTarget action:selector forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
