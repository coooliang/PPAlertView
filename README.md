# PPAlertView
* n alert view
* not profound code , just save your time

```

PPAlertView *alertView = [PPAlertView new];
//    alertView.hiddenCloseButton = YES;
//    alertView.colorTheme = PPAlertViewColorBlue;
[alertView show:@"温馨提示" msg:@"版本更新成功" buttons:@[@"取 消",@"确 定"]];
[alertView callback:^(UIButton * _Nonnull button) {
    NSLog(@"tag %ld",(long)button.tag);
} close:^{
    NSLog(@"close");
}];

```
<img src="https://github.com/coooliang/PPAlertView/blob/master/1.png" width="30%" height="30%" />

<img src="https://github.com/coooliang/PPAlertView/blob/master/2.png" width="30%" height="30%" />

<img src="https://github.com/coooliang/PPAlertView/blob/master/3.png" width="30%" height="30%" />

