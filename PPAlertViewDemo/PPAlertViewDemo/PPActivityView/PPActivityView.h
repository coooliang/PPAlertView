//
//  PPActivityView.h
//  PPAlertViewDemo
//
//  Created by chenliang on 16/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPColorfulActivityView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPActivityView : UIView

- (id)initWithFrame:(CGRect)frame;

- (void)startAnimate;
- (void)stopAnimate;

@end

NS_ASSUME_NONNULL_END
