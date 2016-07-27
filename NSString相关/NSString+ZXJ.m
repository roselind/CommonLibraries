//
//  NSString+ZXJ.m
//
//  Created by 张小静 on 15-6-19.
//  Copyright (c) 2015年 张小静. All rights reserved.
//

#import "NSString+par.h"

@implementation NSString (ZXJ)

- (CGSize) sizeWithFont:(UIFont*) font maxSize:(CGSize) maxSize{
  //NSStringDrawingUsesLineFragmentOrigin 计算出的值 是准确的 ，其他的计算的不准确
   NSDictionary *dic =@{NSFontAttributeName:font};
   return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
 }

@end
