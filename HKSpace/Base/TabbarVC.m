//
//  TabbarVC.m
//  HKSpace
//
//  Created by FC on 17/4/9.
//  Copyright © 2017年 FC. All rights reserved.
//

#import "TabbarVC.h"
#import "FCTabbar.h"
#import "BaseNavigationController.h"

@interface TabbarVC ()<UITabBarControllerDelegate,UITabBarDelegate>

@property(nonatomic,strong)UITabBarController *tabbar;

@property(nonatomic,strong)NSArray * VCArr;

@property(nonatomic,strong)NSMutableArray * vcTabbarArray;

@property(nonatomic,strong)NSArray * normalImageArray;

@property(nonatomic,strong)NSArray * selectImagerray;

@property(nonatomic,strong)NSArray * tabbarTitleArray;

@property(nonatomic,assign)BOOL ishide;

@end

@implementation TabbarVC{

    FCTabbar *_myTabbar;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kViewBackgroundColor;

    [self addChild];
    [self removeTabarTopLine];
    
  
}
-(void)addChild{
    _vcTabbarArray=[[NSMutableArray alloc]init];
    _VCArr=[NSArray  arrayWithObjects:@"HomeVC",@"BrowseVC",@"MessageVC",@"MeVC",nil];
    _normalImageArray=[NSArray  arrayWithObjects:@"normalImage1.png",@"normalImage2",@"normalImage3",@"normalImage4", nil];
    _selectImagerray=[NSArray  arrayWithObjects:@"selectImage1.png",@"selectImage2",@"selectImage3",@"selectImage4", nil];
    _tabbarTitleArray=[NSArray arrayWithObjects:@"首页",@"逛逛",@"消息",@"我的", nil];
    for (int i=0; i<_VCArr.count + 1; i++) {
        if (i != 2) {
            UIViewController *tabbarVC=[[NSClassFromString(_VCArr[i>2 ? i-1 : i]) alloc]init];
            UINavigationController * nvc=[[BaseNavigationController alloc]initWithRootViewController:tabbarVC];
            nvc.navigationBar.topItem.title=_tabbarTitleArray[i>1?i-1:i];
            NSLog(@"%d",i);
            [_vcTabbarArray addObject:nvc];
        }
        
    }
    //    自定义控件  －   真实控件的功能＋假的UI
    _tabbar=[[UITabBarController alloc]init];
    _tabbar.viewControllers=_vcTabbarArray;
    _tabbar.tabBar.alpha=0.6;
    _myTabbar=[[FCTabbar alloc]init];
    _myTabbar.frame=CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49);
    
    [_myTabbar creatFCTabbarWithBackGroundImage:nil orUseBackGroundView:YES ifUseBGViewWithColor:[UIColor whiteColor] withViewControllerArray:_VCArr withNormalImageArray:_normalImageArray withSelectImageArray:_selectImagerray withTabbarItemTitleArray:_tabbarTitleArray withTarget:self withSelector:@selector(itemAction:)];



    [_tabbar.view addSubview:_myTabbar];
    
    [self.view addSubview:_tabbar.view];
    
    //凸起按钮
    UIButton *tuBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    tuBtn.frame = CGRectMake(0, 0, 60, 60);
    tuBtn.layer.cornerRadius = 30;
    tuBtn.backgroundColor = [UIColor whiteColor];
    tuBtn.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 30);
    [tuBtn addTarget:self action:@selector(tuAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tuBtn];


}
- (void)tuAction
{
    _ishide= ! _ishide;
    if (_ishide==YES){
        _myTabbar.hidden=YES;
    }else{
        _myTabbar.hidden=NO;
    }
}
-(void)itemAction:(UIButton *)btn
{
    for (UIView * view in btn.superview.superview.subviews) {
        NSLog(@"%lu",(unsigned long)view.subviews.count);
        if (![view isKindOfClass:[UILabel class]]) {
            UIImageView * imageView=(UIImageView *)[view.subviews objectAtIndex:0];
            UILabel * label=(UILabel *)[view.subviews objectAtIndex:1];
            if (imageView.tag==btn.tag) {
                imageView.image=[UIImage imageNamed:_selectImagerray[btn.tag]];
                label.textColor=[UIColor purpleColor];
            }
            else
            {
                imageView.image=[UIImage imageNamed:_normalImageArray[imageView.tag]];
                label.textColor=[UIColor darkGrayColor];
            }
        }
        
    }
    _tabbar.selectedIndex=btn.tag;
}

- (void)removeTabarTopLine {
    CGRect rect = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabbar.tabBar setBackgroundImage:img];
    [self.tabbar.tabBar setShadowImage:img];
}



@end
