//
//  ZXJTabBarController.m
//  ZXJLotteryTicket
//
//  Created by 张小静 on 15-6-8.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import "ZXJTabBarController.h"
#import "ZXJTabBar.h"
#import "ZXJTabBarButton.h"
#define kTagStartValue 1000

@interface ZXJTabBarController ()<ZXJTabBarDelegate,UITabBarControllerDelegate>
@property(nonatomic,weak)  ZXJTabBar *myTabBar;
@end
@implementation ZXJTabBarController

-(void) viewDidLoad{
    [super viewDidLoad];
    //1.
    ZXJTabBar *myTabBar= [[ZXJTabBar alloc] init];
    myTabBar.delegate =self;
    myTabBar.backgroundColor =[UIColor whiteColor];
    myTabBar.frame =self.tabBar.bounds;
    myTabBar.normalTitleColor = [UIColor purpleColor];//RGB(126, 27, 136);
    myTabBar.selectTitleColor =RGB(56, 176, 235);
    myTabBar.delegate =self;
    self.myTabBar =myTabBar;
    self.delegate =self;
    [self.tabBar addSubview:myTabBar];
    //2.
    NSArray *tabBarItemImages = @[@"tabfire", @"tabList", @"tabjoblist", @"tabbell"];
    NSArray * titles =@[@"AAA",@"BBB",@"CCC",@"DDD"];
    
   
    for (int i=0;i<self.viewControllers.count; i++) {
       
        [myTabBar addTabBarButtonWithTitle:titles[i] norImageName:[NSString stringWithFormat:@"%@_normal",
        [tabBarItemImages objectAtIndex:i]] selectedImage:[NSString stringWithFormat:@"%@_selected",
                                                            [tabBarItemImages objectAtIndex:i]]];
    }
   
  
}
-(void)tabBarDidSelectBtnFrom :(NSInteger) index toIndex:(NSInteger) selIndex{
    NSLog(@"%s",__FUNCTION__);
    
    UIView * currentView = [self.view viewWithTag:kKYNArcTabSelectedViewControllerTag];
    if (currentView&&selIndex != index) {
        self.selectedIndex =selIndex;

    }else if(selIndex != index){
        self.selectedIndex =selIndex;
    }
    UIViewController *  viewController =  self.viewControllers[selIndex];
    viewController.view.tag =kKYNArcTabSelectedViewControllerTag;
   
}
-(void) setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    [_myTabBar setSelectButtonIndex:selectedIndex];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    [_myTabBar setSelectButtonIndex:tabBarController.selectedIndex];
}
@end
