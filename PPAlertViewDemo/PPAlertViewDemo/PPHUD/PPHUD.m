//
//  PPHUD.m
//  PPAlertViewDemo
//
//  Created by chenliang on 16/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "PPHUD.h"
#import <UIKit/UIKit.h>
#import "PPTip.h"

#define WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define HEIGHT ([[UIScreen mainScreen] bounds].size.height)

//static float const pphud_delay = 1.5;
@implementation PPHUD

+(void)showMessage:(NSString *)message{
    [self show:message type:PPTip_Message_Normal_Type];
}


#pragma mark - private
+(void)show:(NSString *)message type:(PPTipType)tipType{
    PPTip *tip = [PPTip sharedInstance];
    tip.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [UIApplication.sharedApplication.keyWindow addSubview:tip];
    [tip showMessage:message type:tipType];
    
    [tip performSelector:@selector(hide) withObject:nil afterDelay:1.5];
}

@end
