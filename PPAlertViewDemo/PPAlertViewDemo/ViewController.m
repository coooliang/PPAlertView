//
//  ViewController.m
//  PPAlertViewDemo
//
//  Created by chenliang on 12/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "ViewController.h"
#import "PPAlertView/PPAlertView.h"
#import "PPActivityView/PPActivityView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)click1:(id)sender{
    PPAlertView *alertView = [PPAlertView new];
    alertView.hiddenCloseButton = YES;
    alertView.hideAnimate = PPAlertViewHideAnimationNone;
    [alertView callback:^(UIButton * _Nonnull button) {
        NSLog(@"tag %ld",(long)button.tag);
    } close:^{
        NSLog(@"close");
    }];
    [alertView show:@"" msg:@"版本更新成功版本更新成功版本更新成功" buttons:@[@"好的，去设置"]];
}
-(IBAction)click11:(id)sender{
    PPAlertView *alertView = [PPAlertView new];
    [alertView callback:^(UIButton * _Nonnull button) {
        NSLog(@"tag %ld",(long)button.tag);
    } close:^{
        NSLog(@"close");
    }];
    [alertView show:@"" msg:@"版本更新成功版本更新成功版本更新成功" buttons:@[@"好的，去设置"]];
}

-(IBAction)click2:(id)sender{
    PPAlertView *alertView = [PPAlertView new];
    //    alertView.hiddenCloseButton = YES;
    alertView.colorTheme = PPAlertViewColorBlue;
    [alertView show:@"温馨提示" msg:@"版本更新成功" buttons:@[@"取 消",@"确 定"]];
    [alertView callback:^(UIButton * _Nonnull button) {
        NSLog(@"tag %ld",(long)button.tag);
    } close:^{
        NSLog(@"close");
    }];
}
-(IBAction)click3:(id)sender{
    PPAlertView *alertView = [PPAlertView new];
    alertView.hiddenCloseButton = YES;
    [alertView show:@"升级提示" msg:@"下次设置请到 我的账户 - 设置 中设置" buttons:@[@"暂不升级",@"立即更新",@"下次不再提醒"]];
    [alertView callback:^(UIButton * _Nonnull button) {
        NSLog(@"tag %ld",(long)button.tag);
    } close:^{
        NSLog(@"close");
    }];
}

-(IBAction)showActivity:(id)sender{
    PPActivityView *activityView = [[PPActivityView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:activityView];
    [activityView startAnimate];
}
@end
