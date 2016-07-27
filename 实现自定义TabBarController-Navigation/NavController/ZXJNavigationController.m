//
//  ZXJNavigationController.m
//
//  Created by 张小静 on 15-6-10.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import "ZXJNavigationController.h"

#import "UINavigationBar+par.h"
@interface ZXJNavigationController ()

@end

@implementation ZXJNavigationController

+(void)initialize{
    //当该类第一次用到的时候使用
    UINavigationBar *navBar =[UINavigationBar appearance];
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    UIImage *image0 =[UIImage imageNamed:@"loginBtn_normal"];
    //UIImage* image =[[UIImage imageNamed:@"logol_white400"] scaleToSize:CGSizeMake(screenSize.width, 44)];
    UIImage *newImage =[image0 setFillBackgroundImage:CGSizeMake(screenSize.width, 44)];
    [navBar setBackgroundColor:ParColor_navBackgroudColor];
    [navBar setBackgroundImage:newImage forBarMetrics:UIBarMetricsDefault];
    //[navBar setBounds:CGRectMake(0,0, screenSize.width, screenSize.height)];
    NSMutableDictionary *dic =[NSMutableDictionary dictionary];
    dic[NSFontAttributeName] =[UIFont systemFontOfSize:16];
    dic[NSForegroundColorAttributeName] =[UIColor whiteColor];
    [navBar setTitleTextAttributes:dic];
    
    //设置导航上返回按钮和图片的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *barItem =[UIBarButtonItem appearance];
    //[barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton-1"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //[barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    if (!iOS7) {
        //设置普通按钮的图片
        [barItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        //设置返回按钮的属性
        
        [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }else{
        //设置 UIBarItem 的主题
        NSMutableDictionary *barDic =[NSMutableDictionary dictionary];
        barDic[NSFontAttributeName] =[UIFont systemFontOfSize:16];
        barDic[NSForegroundColorAttributeName] =[UIColor whiteColor];
        [barItem setTitleTextAttributes: barDic forState:UIControlStateNormal];
        
    }
    //NSLog(@"%s",__FUNCTION__);
}



-(void)viewDidLoad{
    [super viewDidLoad];
    [self addlogol:self.view];
}
- (BOOL) prefersStatusBarHidden{
    return YES;
}
- (void) addlogol:(UIView *) sourceView {
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    UIImage *image0 =[UIImage imageNamed:@"logol_white400"];
    CGFloat width  =MIN(screenSize.width-120,image0.size.width);
    CGFloat height  = 40 ;
    if(isIpad){
        width   = height* image0.size.width/image0.size.height ;
    }
    CGRect rect =CGRectMake((screenSize.width-width)*0.5, 0,width, height) ;
    UIImage *newImage =[image0 scaleToSize:CGSizeMake(width, 40)];
    UIImageView* imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,(44-newImage.size.height)*0.5,rect.size.width,newImage.size.height)];

    imageView.image =newImage;
    UIView* navView= [[UIView alloc] initWithFrame:rect];
    [navView setBackgroundColor:ParColor_navBackgroudColor];
    [navView addSubview:imageView];
    [sourceView addSubview:navView];
    
}

-(void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed  =YES ;
    [super pushViewController:viewController animated:animated];
}
@end
