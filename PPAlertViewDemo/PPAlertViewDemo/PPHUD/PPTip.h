//
//  PPTip.h
//  PPAlertViewDemo
//
//  Created by chenliang on 16/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PPTip_Message_Success_Type,
    PPTip_Message_Fail_Type,
    PPTip_Message_Warn_Type,
    PPTip_Message_Normal_Type
} PPTipType;
NS_ASSUME_NONNULL_BEGIN

@interface PPTip : UIView

+ (id)sharedInstance;

-(void)showMessage:(NSString *)message type:(PPTipType)tipType;
-(void)hide;

@property(nonatomic,strong) UILabel *messageLabel;

@end

NS_ASSUME_NONNULL_END
