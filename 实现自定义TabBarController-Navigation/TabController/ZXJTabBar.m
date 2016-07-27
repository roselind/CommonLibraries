//
//  ZXJTabBar.m
//  ZXJLotteryTicket
//
//  Created by 张小静 on 15-6-8.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import "ZXJTabBar.h"
#import "ZXJTabBarButton.h"
static NSInteger kTagStartValue  =1000;

@interface ZXJTabBar()
@property (nonatomic ,strong) NSArray *subViewControllers;
@property (nonatomic,weak) UILabel  *labelTitle;
@end

@implementation ZXJTabBar
-(instancetype) initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)setNormalTitleColor:(UIColor *)normalTitleColor{

    _normalTitleColor =normalTitleColor;
    [self setTitleColor:normalTitleColor state:UIControlStateNormal];
}
-(void)setSelectTitleColor:(UIColor *)selectTitleColor{
    _selectTitleColor =selectTitleColor;
    [self setTitleColor:selectTitleColor state:UIControlStateDisabled];
    
}
-(void)setTitleColor:(UIColor *) color state:(UIControlState) state{
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:[ZXJTabBarButton class]]) {
            ZXJTabBarButton* tabBtn =(ZXJTabBarButton *) subView;
            [tabBtn setTitleColor:color forState:state];
            break;
        }
    }

    
}

-(void) addTabBarButton:(NSString* ) norImageName selectedImage: (NSString* ) selectedImageName{
    ZXJTabBarButton *btn =[[ZXJTabBarButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateDisabled];
    btn.tag = kTagStartValue+self.subviews.count;
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if (0==self.subviews.count) {
        [self btnOnClick:btn];
    }
    [self addSubview:btn];
    btn.adjustsImageWhenHighlighted =NO;
}
-(void) addTabBarButtonWithTitle:(NSString *)title norImageName:(NSString* ) norImageName selectedImage: (NSString* ) selectedImageName{
    //[self addTabBarButton:norImageName selectedImage:selectedImageName];
    ZXJTabBarButton *btn =[[ZXJTabBarButton alloc] init];
    [btn setImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateDisabled];
    btn.tag = kTagStartValue+self.subviews.count;
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:self.normalTitleColor forState:UIControlStateNormal];
    [btn setTitleColor:self.selectTitleColor forState:UIControlStateDisabled];
    //[btn setBackgroundColor:[UIColor whiteColor]];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabBtnBack"] forState:UIControlStateDisabled];
    if (0==self.subviews.count) {
        [self btnOnClick:btn];
    }
    [self addSubview:btn];
    btn.adjustsImageWhenHighlighted =NO;

}
-(void) layoutSubviews{
    [super layoutSubviews];
    for (int i=0 ;i<self.subviews.count;i++) {
        UIButton * btn =self.subviews[i];
        CGFloat width = self.frame.size.width /self.subviews.count;
        CGFloat height = self.frame.size.height;
        [btn setFrame:CGRectMake(width*i, 0, width, height)];
    }
}
-(void)btnOnClick:(UIButton *) sender{
    NSLog(@"%s",__FUNCTION__) ;
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:toIndex:)]) {
        [self.delegate tabBarDidSelectBtnFrom:self.selectButton.tag-kTagStartValue toIndex:sender.tag- kTagStartValue];
        
    }
    if (self.selectButton) {
        // self.selectButton.selected = NO;
        self.selectButton.enabled = YES;
    }
    // sender.selected = YES;
    sender.enabled =NO;
    self.selectButton = sender ;
  //  self.selectedIndex  =sender.tag -kTagStartValue;
}
-(void) setSelectButtonIndex:(NSInteger) index{
    if (self.selectButton) {
        // self.selectButton.selected = NO;
        self.selectButton.enabled = YES;
    }
    for (int i=0 ;i<self.subviews.count;i++) {
        UIButton * btn =self.subviews[i];
        if (btn.tag -kTagStartValue ==index) {
            btn.enabled = NO;
            self.selectButton =btn;
        }
        
    }
}
@end
