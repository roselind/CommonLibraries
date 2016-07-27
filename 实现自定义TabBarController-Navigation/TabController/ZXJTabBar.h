//
//  ZXJTabBar.h
//  ZXJLotteryTicket
//
//  Created by 张小静 on 15-6-8.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXJTabBar;
@protocol ZXJTabBarDelegate <NSObject>

-(void)tabBarDidSelectBtnFrom :(NSInteger) index toIndex:(NSInteger) selIndex;
@end
@interface ZXJTabBar : UIView
@property (nonatomic,weak) UIButton *selectButton;
@property (nonatomic,weak) UIColor * normalTitleColor;
@property (nonatomic,weak) UIColor * selectTitleColor;
@property (nonatomic,weak) UIColor * selectBackColor;

@property (nonatomic,weak) id<ZXJTabBarDelegate> delegate;
-(void) addTabBarButton:(NSString* ) norImageName selectedImage: (NSString* ) selectedImageName;
-(void) addTabBarButtonWithTitle:(NSString *)title norImageName:(NSString* ) norImageName selectedImage: (NSString* ) selectedImageName;
-(void) setSelectButtonIndex:(NSInteger) index;
@end
