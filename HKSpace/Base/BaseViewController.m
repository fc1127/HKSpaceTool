//
//  BaseViewController.m
//  HKSpace
//
//  Created by FC on 17/4/9.
//  Copyright © 2017年 FC. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(kMainBg);

    
#ifdef __IPHONE_7_0
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (self.navigationController)
    {
        self.view.frame = kcr(0, 0, SW, SH - TOP_HEIGHT);
    }
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
