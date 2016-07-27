//
//  UIImage+ZXJ.h
//
//  Created by 张小静 on 15-6-11.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZXJ)
-(instancetype)scaleToSize :(CGSize)size;
-(instancetype)setFillBackgroundImage:(CGSize) size;
-(instancetype)initImageFillText:(NSString *)text size:(CGSize) size color:(UIColor *) color;
-(UIImage*)getSubImage:(CGRect)rect;
-(void) printImageWithUrl:(NSString *) pathUrl;
@end
