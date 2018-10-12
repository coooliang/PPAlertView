//
//  PPAlertView.m
//  Test
//
//  Created by chenliang on 09/10/2018.
//  Copyright © 2018 yypt. All rights reserved.
//

#import "PPAlertView.h"
#import "UIColor+Tools.h"
#import "UIView+CGAffineTransfor.h"


typedef void (^CloseBlock)(void);
typedef void (^ButtonBlock)(UIButton *button);

#define ONE_SCALE (1/[UIScreen mainScreen].scale)
#define ONE_LINE_COLOR ([UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1])
#define WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define safeString(obj) (([obj isEqual:[NSNull null]] || (obj == nil) || [@"null" isEqual:obj] || [@"<null>" isEqual:obj] || [@"(null)" isEqual:obj]) ? @"" : ([NSString stringWithFormat:@"%@",obj]))

@implementation PPAlertView{
    CloseBlock _closeBlock;
    ButtonBlock _buttonBlock;
    
    NSString *_titleFontFamily;
    NSString *_bodyTextFontFamily;
    NSString *_buttonsFontFamily;
}

- (instancetype)init{
    self = [super init];
    if (self) {
         self.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        _hideAnimate = PPAlertViewHideAnimationFadeOut;
        _colorTheme = PPAlertViewColorYellow;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        _titleFontFamily = @"HelveticaNeue";
        _bodyTextFontFamily = @"HelveticaNeue";
        _buttonsFontFamily = @"HelveticaNeue-Bold";
    }
    return self;
}

-(void)show:(NSString *)title msg:(NSString *)msg buttons:(NSArray *)buttons{
    NSParameterAssert(buttons);
    if (buttons.count > 5) {
        NSLog(@"Warning: array count > 5");
    }
    float bgWidth = WIDTH-40;
    if (bgWidth > 320) {
        bgWidth = 330;
    }
    float bgHeight = 200;
    _whiteBg = [[UIView alloc]initWithFrame:CGRectMake((WIDTH-bgWidth)/2.0, (HEIGHT-bgHeight)/2.0-40, bgWidth, bgHeight)];
    _whiteBg.backgroundColor = [UIColor whiteColor];
    _whiteBg.layer.cornerRadius = 5;
    _whiteBg.layer.masksToBounds = YES;
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, bgWidth-80, 40)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    UIFont *f = [UIFont fontWithName:_titleFontFamily size:24];
    if (!f) {
        f = [UIFont boldSystemFontOfSize:24];
    }
    _titleLabel.font = f;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = safeString(title);
    [_whiteBg addSubview:_titleLabel];
    
    //close button
    if(!_hiddenCloseButton){
        UIButton *closeButton = [[UIButton alloc]initWithFrame:CGRectMake(_whiteBg.frame.size.width-50, 0, 50, 50)];
        closeButton.backgroundColor = [UIColor clearColor];
        [closeButton setImage:[UIImage imageNamed:@"closed"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [_whiteBg addSubview:closeButton];
    }
    
    float msgWidth = bgWidth-40;
    UIFont *msgFont = [UIFont fontWithName:_bodyTextFontFamily size:16];
    if (!msgFont) {
        msgFont = [UIFont systemFontOfSize:16];
    }
    int msgHeight = 40;
    if (msg && ![@""isEqualToString:msg]) {
        msgHeight = [self getMessageHeightWithText:msg width:msgWidth font:msgFont];
        msgHeight = msgHeight<20?20:((msgHeight%20)>0?(msgHeight/20+1)*20:(msgHeight/20)*20);
        if (msgHeight > 160) {
            msgHeight = 160;
        }
    }
    _msgLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_titleLabel.frame)+10, msgWidth, msgHeight)];
    _msgLabel.backgroundColor = [UIColor clearColor];
    _msgLabel.font = msgFont;
    _msgLabel.numberOfLines = 0;
    _msgLabel.textAlignment = NSTextAlignmentCenter;
    _msgLabel.text = safeString(msg);
    [_whiteBg addSubview:_msgLabel];
    
    UIColor *buttonColor;
    switch (_colorTheme) {
        case PPAlertViewColorBlue:
            buttonColor = [UIColor colorWithRed:0.156 green:0.399 blue:0.748 alpha:1.000];
            break;
            case PPAlertViewColorGray:
                buttonColor = [UIColor colorWithRed:0.447 green:0.451 blue:0.459 alpha:1.000];
            break;
            case PPAlertViewColorGreen:
                buttonColor = [UIColor colorWithRed:0.132 green:0.711 blue:0.451 alpha:1.000];
            break;
            case PPAlertViewColorPurple:
                buttonColor = [UIColor colorWithRed:0.644 green:0.162 blue:0.999 alpha:1.000];
            break;
            case PPAlertViewColorViolet:
                buttonColor = [UIColor colorWithRed:0.253 green:0.249 blue:0.565 alpha:1.000];
            break;
        default:
            buttonColor = [UIColor colorWithHexString:@"ffa800"];//yellow
            break;
    }
    
    float originY = CGRectGetMaxY(_msgLabel.frame);
    if (buttons.count < 3) {
        originY += 10;
        //add line
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, originY, bgWidth-40, ONE_SCALE)];
        line.backgroundColor = ONE_LINE_COLOR;
        [_whiteBg addSubview:line];
        
        originY+=20;
        if(buttons.count == 1){
            UIButton *sureButton = [self createButton:CGRectMake(20, originY, bgWidth-40, 50) title:buttons[0] tag:0];
            sureButton.backgroundColor = buttonColor;
            [_whiteBg addSubview:sureButton];
            originY+=70;
        }else if(buttons.count == 2){
            float buttonWidth = (bgWidth-60)/2.0;
            UIButton *leftButton = [self createButton:CGRectMake(20, originY, buttonWidth, 50) title:buttons[0] tag:0];
            [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [leftButton setTitleColor:ONE_LINE_COLOR forState:UIControlStateHighlighted];
            leftButton.backgroundColor = [UIColor whiteColor];
            leftButton.layer.borderWidth = 1;
            leftButton.layer.borderColor = [UIColor grayColor].CGColor;
            [_whiteBg addSubview:leftButton];
            
            UIButton *rightButton = [self createButton:CGRectMake(buttonWidth+40, originY, buttonWidth, 50) title:buttons[1] tag:1];
            rightButton.backgroundColor = buttonColor;
            [_whiteBg addSubview:rightButton];
            originY+=70;
        }
    }else if(buttons.count > 2){
        originY+=20;
        for (int i=0;i<buttons.count;i++) {
            NSString *bt = buttons[i];
            if (![@""isEqualToString:safeString(bt)]) {
                //add line
                UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20, originY, bgWidth-40, ONE_SCALE)];
                line.backgroundColor = ONE_LINE_COLOR;
                [_whiteBg addSubview:line];
                
                UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, originY, bgWidth, 50)];
                button.tag = i;
                [button setTitle:bt forState:UIControlStateNormal];
                [button setTitleColor:buttonColor forState:UIControlStateNormal];
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
                UIFont *f = [UIFont fontWithName:_buttonsFontFamily size:18];
                if (!f) {
                    f = [UIFont boldSystemFontOfSize:18];
                }
                button.titleLabel.font = f;
                button.titleLabel.textAlignment = NSTextAlignmentCenter;
                button.backgroundColor = [UIColor clearColor];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [_whiteBg addSubview:button];
                
                originY+=50;
            }
            if (i == 4) {// max 5 buttons
                break;
            }
        }
    }
    
    CGRect temp = _whiteBg.frame;
    temp.size.height = originY;
    float oy = (HEIGHT-originY)/2.0 - originY/4.0;//略微上移，方便点击
    if (oy < 20) {
        oy = 20;
    }
    temp.origin.y = oy;
    _whiteBg.frame = temp;
    [self addSubview:_whiteBg];
    
    [UIApplication.sharedApplication.keyWindow addSubview:self];
    [_whiteBg show:nil];
}

-(void)callback:(void(^)(UIButton *button))buttonBlock close:(void(^)(void))closeBlock{
    _buttonBlock = buttonBlock;
    _closeBlock = closeBlock;
}

#pragma mark - click
-(void)buttonClick:(UIButton *)button{
    if (_buttonBlock) {
        _buttonBlock(button);
    }
    [self hidden];
}

-(void)close{
    if (_closeBlock) {
        _closeBlock();
    }
    [self hidden];
}
-(void)hidden{
    if (_hideAnimate == PPAlertViewHideAnimationNone){
        [self removeFromSuperview];
    }else{
        [_whiteBg hidden:^{
            [self removeFromSuperview];
        }];
    }
}

-(UIButton *)createButton:(CGRect)frame title:(NSString *)title tag:(int)tag{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    button.tag = tag;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    UIFont *f = [UIFont fontWithName:_buttonsFontFamily size:18];
    if (!f) {
        f = [UIFont boldSystemFontOfSize:18];
    }
    button.titleLabel.font = f;
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(int)getMessageHeightWithText:(NSString*)text width:(float)width font:(UIFont *)font{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return (int)size.height;
}

- (void)dealloc{
    //NSLog(@"%@ dealloc",[self class]);
}
@end
