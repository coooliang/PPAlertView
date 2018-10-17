# PPAlertView
* an alert view
* not profound code , just save your time

```
PPAlertView *alertView = [PPAlertView new];
//alertView.hiddenCloseButton = YES;
//alertView.colorTheme = PPAlertViewColorBlue;
[alertView show:@"温馨提示" msg:@"版本更新成功" buttons:@[@"取 消",@"确 定"]];
[alertView callback:^(UIButton * _Nonnull button) {
    NSLog(@"tag %ld",(long)button.tag);
} close:^{
    NSLog(@"close");
}];

```
<figure>
	<img src="https://github.com/coooliang/PPAlertView/blob/master/alertview.png" width="30%" height="60%" />
</figure>

```
PPActivityView *activityView = [[PPActivityView alloc]initWithFrame:self.view.bounds];
[self.view addSubview:activityView];
[activityView startAnimate];
```

<figure>
<img src="https://github.com/coooliang/PPAlertView/blob/master/21.png" width="30%" height="60%" />
</figure>

```
[PPHUD showMessage:@"hello world"];
```

<figure>
<img src="https://github.com/coooliang/PPAlertView/blob/master/31.png" width="30%" height="60%" />
</figure>


