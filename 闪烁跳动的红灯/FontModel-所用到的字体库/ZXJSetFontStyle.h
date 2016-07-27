

#import <Foundation/Foundation.h>
#import "NSString+FontAwesome.h"
@interface ZXJSetFontStyle : NSMutableAttributedString

-(ZXJSetFontStyle *) changeStyle:(FAIcon)value size:(int)size range:(NSRange)range  backColor:(UIColor *)backColor  foreColor:(UIColor *) foreColor;

@end
