//
//  HUDViewController.m
//  PPAlertViewDemo
//
//  Created by chenliang on 17/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "HUDViewController.h"
#import "PPHUD.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PPHUD";
    self.dataArray = @[@"showMessage"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            [PPHUD showMessage:@"hello world"];
        }
            break;
            
        default:
            break;
    }
}

@end
