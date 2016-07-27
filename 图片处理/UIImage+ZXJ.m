//
//  UIImage+ZXJ.m
//
//  Created by 张小静 on 15-6-11.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import "UIImage+par.h"

@implementation UIImage (ZXJ)

-(UIImage*)scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //Determine whether the screen is retina
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
    
/*
- (UIImage *)scaleToSize :(CGSize)size{
    
    // 创建一个bitmap的context
    
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    
    [self drawInRect:CGRectMake(0,0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    //返回新的改变大小后的图片
    
    return scaledImage;
    
}*/
-(instancetype)setFillBackgroundImage:(CGSize) size
{
    // 0. 加载背景图片
   // UIImage *image = [UIImage imageNamed:bgName];
    
    // 1.创建bitmap上下文
    // 执行完这一行在内存中就相遇创建了一个UIImage
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 2.绘图图片
    // 绘制背景图片
    //[image drawAtPoint:CGPointMake(0, 0)];
    
    // 绘制水印'
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    
    CGFloat logY = (size.height-self.size.height)*0.5;
    CGFloat logX = (size.width - self.size.width)*0.5;
    [self drawAtPoint:CGPointMake(logX, logY)];
    
    //    NSString *str = @"黑马程序员";
    //    [str drawAtPoint:CGPointMake(150, 50) withAttributes:nil];
    
    // 3.获得图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}

-(instancetype)initImageFillText:(NSString *)text size:(CGSize) size color:(UIColor *) color{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(0, 0, size.width, size.height));
    CGFloat oY = 3;
    CGFloat oX = 3;
    NSDictionary* dic =@{NSForegroundColorAttributeName:color ,NSFontAttributeName:[UIFont systemFontOfSize:15 weight:5]};
    [text drawAtPoint:CGPointMake(oX,oY) withAttributes:dic];
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

-(void) printImageWithUrl:(NSString *) pathUrl{
   
    NSData *newImageData =UIImagePNGRepresentation(self);
    if ([newImageData writeToFile:pathUrl atomically:YES]) {
        NSLog(@"打印成功~");
    };
}
@end
