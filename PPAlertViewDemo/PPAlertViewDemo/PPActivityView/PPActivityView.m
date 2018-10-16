//
//  PPActivityView.m
//  PPAlertViewDemo
//
//  Created by chenliang on 16/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "PPActivityView.h"

static float const time_out_seconds = 20;

@implementation PPActivityView{
    PPColorfulActivityView *_indicatorView;
    NSTimer *_timer;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width-122)/2, (frame.size.height-53)/2, 122, 53)];
        blackView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9]; //
        blackView.layer.shadowColor = [UIColor grayColor].CGColor;
        blackView.layer.shadowOffset = CGSizeMake(0, 3);
        blackView.layer.shadowOpacity = 0.5;
        blackView.layer.shadowRadius = 6.0;
        blackView.layer.cornerRadius = 10.0;
        blackView.clipsToBounds = NO;
        // 添加等待动作视图
        _indicatorView = [[PPColorfulActivityView alloc] initWithFrame:CGRectMake((blackView.bounds.size.width - 122) / 2, (blackView.bounds.size.height - 53) / 2, 122, 53)];
        _indicatorView.backgroundColor = [UIColor clearColor];
        _indicatorView.layer.cornerRadius = 10; //圆角
        _indicatorView.layer.masksToBounds = YES;
        _indicatorView.layer.borderColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.00 blue:229.0/255.0 alpha:1].CGColor;
        _indicatorView.layer.borderWidth = 1.0f;
        
        [blackView addSubview:_indicatorView];
        [self addSubview:blackView];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.superview) {
        self.center = CGPointMake(self.superview.center.x, self.superview.center.y);
    }
}

-(void)startAnimate{
    //隐藏键盘
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    self.hidden = NO;
    [_indicatorView startAnimating];
    //20秒超时关闭
    if(_timer != nil){
        [_timer invalidate];
        _timer = nil;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:time_out_seconds target:self selector:@selector(loadTimeOut) userInfo:nil repeats:NO];
}

-(void)stopAnimate{
    self.hidden = YES;
    [_indicatorView stopAnimating];
    //关闭timer
    if(_timer != nil){
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - private
- (void)loadTimeOut{
    [self stopAnimate];
    //关闭timer
    if(_timer != nil){
        [_timer invalidate];
        _timer = nil;
    }
}

@end
