
#import "ZXJFlashingView.h"
#import "NSString+FontAwesome.h"
@interface ZXJFlashingView()
#define ANGLE(a) 2*M_PI/360*a

//0.0 - 1.0
@property (nonatomic, assign) CGFloat anglePer;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel * showText;
@property (nonatomic, strong) UIImageView* imageView;
@end
@implementation PAFlashingView
@synthesize showText;
@synthesize imageView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        showText =[[UILabel alloc] initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
        showText.frame =frame;
        [self addSubview:showText];
    
        [self setworkStateAttribuString:showText forColor:[UIColor redColor] andFontSize:30];
    }
    return self;
}

-(void)setworkStateAttribuString:(UILabel *)label   forColor:(UIColor *) colorValue andFontSize:(int) stateFontSize
{
    NSMutableAttributedString *attribuString =[[NSMutableAttributedString alloc] initWithString:[NSString fontAwesomeIconStringForEnum:FALightbulbO]];
    [attribuString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontAwesomeFamilyName size:stateFontSize] range:NSMakeRange(0, 1)];
    
    label.textColor=colorValue;
    label.font =[UIFont fontWithName:kFontAwesomeFamilyName size:stateFontSize];
    
    label.text =attribuString.string;
    label.textAlignment = ParLabelAlignmentCenter;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        showText =[[UILabel alloc] init];
        [self addSubview:showText];
        [self setworkStateAttribuString:showText forColor:[UIColor whiteColor] andFontSize:60];

    }
    return self;
}

- (void)setAnglePer:(CGFloat)anglePer
{
    _anglePer = anglePer;
    [self setNeedsDisplay];
}

- (void)startAnimation
{
   
    if (self.isAnimating) {
        [self stopAnimation];
        [self.layer removeAllAnimations];
    }
    self.backgroundColor = [UIColor whiteColor];
    _isAnimating = YES;
    showText.hidden = NO;
    self.anglePer = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02f
                                                  target:self
                                                selector:@selector(drawPathAnimation:)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopAnimation
{
    _isAnimating = NO;
     showText.hidden = YES;
     self.backgroundColor = [UIColor clearColor];
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self stopRotateAnimation];
}

- (void)drawPathAnimation:(NSTimer *)timer
{
    self.anglePer += 0.03f;
    
    if (self.anglePer >= 1) {
        self.anglePer = 1;
        [timer invalidate];
        self.timer = nil;
        [self startRotateAnimation];
    }
}

- (void)startRotateAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = 0.5f;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
    
    
    [self.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

- (void)stopRotateAnimation
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.anglePer = 0;
        [self.layer removeAllAnimations];
        self.alpha = 1;
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
