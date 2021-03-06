//
//  PPTip.m
//  PPAlertViewDemo
//
//  Created by chenliang on 16/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "PPTip.h"

#define WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define bg [UIColor colorWithRed:1 green:1 blue:1 alpha:0]
#define label_font [UIFont boldSystemFontOfSize:16]


@implementation PPTip

//单例
+ (id)sharedInstance{
    static PPTip *instance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = bg;
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-150)/2.0, (HEIGHT-50)/2.0-50, 150,50)];
        _messageLabel.font = label_font;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = [UIColor colorWithRed:0.267 green:0.271 blue:0.271 alpha:1.000];
        _messageLabel.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9];
        _messageLabel.layer.shadowColor = [UIColor grayColor].CGColor;
        _messageLabel.layer.shadowOffset = CGSizeMake(0, 3);
        _messageLabel.layer.shadowOpacity = 0.5;
        _messageLabel.layer.shadowRadius = 6.0;
        _messageLabel.layer.cornerRadius = 10.0;
        _messageLabel.clipsToBounds = NO;
    }
    return self;
}

+(CGSize)getMessageSizeWithText:(NSString*)text font:(UIFont *)font{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(150, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
}
#define WEAKSELF typeof(self) __weak weakSelf = self;
-(void)showMessage:(NSString *)message type:(PPTipType)tipType{
    _messageLabel.alpha = 0;
    _messageLabel.text = message;
    [self addSubview:_messageLabel];
    WEAKSELF
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.messageLabel.alpha = 1;
    }];
}

-(void)hide{
    if (_messageLabel) {
        WEAKSELF
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.messageLabel.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf.messageLabel removeFromSuperview];
            [weakSelf removeFromSuperview];
        }];
    }
}
@end
