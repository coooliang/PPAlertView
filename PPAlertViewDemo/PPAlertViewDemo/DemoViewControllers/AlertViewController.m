//
//  AlertViewController.m
//  PPAlertViewDemo
//
//  Created by chenliang on 17/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "AlertViewController.h"
#import "PPAlertView.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PPlertView";
    self.dataArray = @[@"one button",@"two button",@"color button",@"hide close button",@"set hideAnimate",@"three button"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            PPAlertView *alertView = [PPAlertView new];
            [alertView callback:^(UIButton * _Nonnull button) {
                NSLog(@"tag %ld",(long)button.tag);
            } close:^{
                NSLog(@"close");
            }];
            [alertView show:@"" msg:@"版本更新成功版本更新成功版本更新成功" buttons:@[@"好的，去设置"]];
        }
            break;
        case 1:{
            PPAlertView *alertView = [PPAlertView new];
            [alertView show:@"温馨提示" msg:@"版本更新成功" buttons:@[@"取 消",@"确 定"]];
            [alertView callback:^(UIButton * _Nonnull button) {
                NSLog(@"tag %ld",(long)button.tag);
            } close:^{
                NSLog(@"close");
            }];
        }
            break;
        case 2:{
            PPAlertView *alertView = [PPAlertView new];
            alertView.colorTheme = PPAlertViewColorBlue;
            [alertView show:@"温馨提示" msg:@"版本更新成功" buttons:@[@"取 消",@"确 定"]];
            [alertView callback:^(UIButton * _Nonnull button) {
                NSLog(@"tag %ld",(long)button.tag);
            } close:^{
                NSLog(@"close");
            }];
        }
            break;
        case 3:{
            PPAlertView *alertView = [PPAlertView new];
            alertView.hiddenCloseButton = YES;
            [alertView callback:^(UIButton * _Nonnull button) {
                NSLog(@"tag %ld",(long)button.tag);
            } close:^{
                NSLog(@"close");
            }];
            [alertView show:@"" msg:@"版本更新成功" buttons:@[@"好的，去设置"]];
        }
            break;
        case 4:{
            PPAlertView *alertView = [PPAlertView new];
            alertView.hideAnimate = PPAlertViewHideAnimationNone;
            [alertView callback:^(UIButton * _Nonnull button) {
                NSLog(@"tag %ld",(long)button.tag);
            } close:^{
                NSLog(@"close");
            }];
            [alertView show:@"" msg:@"版本更新成功" buttons:@[@"好的，去设置"]];
        }
            break;
        case 5:{
            PPAlertView *alertView = [PPAlertView new];
            alertView.hiddenCloseButton = YES;
            [alertView show:@"升级提示" msg:@"下次设置请到 我的账户 - 设置 中设置" buttons:@[@"暂不升级",@"立即更新",@"下次不再提醒"]];
            [alertView callback:^(UIButton * _Nonnull button) {
                NSLog(@"tag %ld",(long)button.tag);
            } close:^{
                NSLog(@"close");
            }];
        }
            break;
        default:
            break;
    }
}

@end
