//
//  ZXJTabBarButton.m
//  ZXJLotteryTicket
//
//  Created by 张小静 on 15-6-8.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import "ZXJTabBarButton.h"

@interface ZXJTabBarButton()
@property (nonatomic,strong) UIFont *myFont;
@end

@implementation ZXJTabBarButton
 -(void)setHighlighted:(BOOL)highlighted{
    NSLog(@"%s",__FUNCTION__);
}
-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    if (self =[super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}
-(instancetype) initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
- (void) setUp{
    self.myFont =[UIFont systemFontOfSize:12];
    self.titleLabel.font =self.myFont;
    self.imageView.contentMode =UIViewContentModeCenter;
}
- (CGSize)getTitleSize{
    NSString *title =self.currentTitle;
    CGSize maxSize =CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize titleSize ;
    NSMutableDictionary *muDic =[NSMutableDictionary dictionary];
    muDic[NSFontAttributeName] =self.myFont;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

        CGRect titleRect =[title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:muDic context:nil];
        titleSize =titleRect.size;
#else
        titleSize =[title sizeWithFont:self.myFont];
    
#endif
    return titleSize;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGSize  titleSize =[self getTitleSize];
    CGFloat titleX =0;
    CGFloat titleY =0.0f;
    CGFloat titleH =titleSize.height;
    CGFloat titleW =titleSize.width;
    titleY =contentRect.size.height -titleH;
    titleX =(contentRect.size.width- titleW)*0.5;
    return CGRectMake(titleX, titleY,titleW, titleH);
    
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGSize  titleSize =[self getTitleSize];
    CGFloat imageY =0;
    CGFloat imageH =contentRect.size.height-titleSize.height;
    CGFloat imageW=contentRect.size.height-titleSize.height;
    CGFloat imageX=(contentRect.size.width-imageW)*0.5;
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
