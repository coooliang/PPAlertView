/**
 *  调用方式：
 *  [_background sadeIn:^{
 *    [_background addSubview:_webContainer];
 *    [_webContainer show:^{
 *      [self loadUrl:_url webview:alertWebView];
 *    }];
 *  }];
*/

#import "UIView+CGAffineTransfor.h"

@implementation UIView (CGAffineTransform)
-(void)show:(void(^)(void))finishBlock{
    //缩小创建好的视图
    CGAffineTransform newTransform = CGAffineTransformScale(self.transform, 0.1, 0.1);
    [self setTransform:newTransform];
    
    //第一次显示的时候放大它
    [UIView animateWithDuration:animateWithDuration_times animations:^{
        CGAffineTransform newTransform = CGAffineTransformConcat(self.transform, CGAffineTransformInvert(self.transform));
        [self setTransform:newTransform];
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
}
-(void)hidden:(void(^)(void))finishBlock{
    [UIView animateWithDuration:animateWithDuration_times animations:^{
        CGAffineTransform newTransform =  CGAffineTransformScale(self.transform, 0.01, 0.01);
        [self setTransform:newTransform];
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
    
}

//淡入
-(void)sadeIn:(void(^)(void))finishBlock{
    self.alpha = 0.0;
    [UIView animateWithDuration:animateWithDuration_sade_times animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
}
//淡出
-(void)sadeOut:(void(^)(void))finishBlock{
    [UIView animateWithDuration:animateWithDuration_sade_times animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
}

//上往下移动
-(void)down:(void(^)(void))finishBlock{
    CGRect old = self.frame;
    CGRect new = self.frame;
    new.origin.y = -self.frame.size.height;
    self.frame = new;
    [UIView animateWithDuration:animateWithDuration_sade_times animations:^{
        self.frame = old;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
}
@end
