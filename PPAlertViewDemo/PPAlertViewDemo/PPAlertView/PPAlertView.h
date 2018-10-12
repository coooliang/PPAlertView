//
//  PPAlertView.h
//  Test
//
//  Created by chenliang on 09/10/2018.
//  Copyright © 2018 yypt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PPAlertViewHideAnimation){
    PPAlertViewHideAnimationNone,
    PPAlertViewHideAnimationFadeOut,
};
typedef NS_ENUM(NSInteger, PPAlertViewColor){
    PPAlertViewColorYellow,
    PPAlertViewColorBlue,
    PPAlertViewColorGray,
    PPAlertViewColorPurple,
    PPAlertViewColorViolet,
    PPAlertViewColorGreen
};


@interface PPAlertView : UIView

-(void)show:(NSString *)title msg:(NSString *)msg buttons:(NSArray *)buttons;

-(void)callback:(void(^)(UIButton *button))buttonBlock close:(void(^)(void))closeBlock;


@property(nonatomic,strong)UILabel  *titleLabel;
@property(nonatomic,strong)UILabel  *msgLabel;
@property(nonatomic,strong)UIView   *whiteBg;

@property(nonatomic,assign)PPAlertViewHideAnimation hideAnimate;//是否使用动画
@property(nonatomic,assign)PPAlertViewColor colorTheme;//是否使用动画
@property(nonatomic,assign)BOOL hiddenCloseButton;
@end

NS_ASSUME_NONNULL_END
