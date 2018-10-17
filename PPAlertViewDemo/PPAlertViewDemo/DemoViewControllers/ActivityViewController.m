//
//  ActivityViewController.m
//  PPAlertViewDemo
//
//  Created by chenliang on 17/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "ActivityViewController.h"
#import "PPActivityView.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PPActivityView";
    self.dataArray = @[@"show"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            PPActivityView *activityView = [[PPActivityView alloc]initWithFrame:self.view.bounds];
            [self.view addSubview:activityView];
            [activityView startAnimate];
        }
            break;
            
        default:
            break;
    }
}


@end
