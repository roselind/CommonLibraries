

#import "ZXJSetFontStyle.h"

@implementation ZXJSetFontStyle
+(ZXJSetFontStyle *) Creat
{
    static ZXJSetFontStyle *_sharedStyle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStyle =[[ZXJSetFontStyle alloc]init];
    });
    
    return _sharedStyle;
}
-(NSMutableAttributedString *) changeStyle:(FAIcon)value size:(int)size range:(NSRange)range  backColor:(UIColor *)backColor  foreColor:(UIColor *) foreColor
{
    NSMutableAttributedString* attributedString=
    attributedString=[[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FAUser]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:size] range:range];
    //设置颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:backColor range:range];
    //动态创建

    return self;
}

@end
