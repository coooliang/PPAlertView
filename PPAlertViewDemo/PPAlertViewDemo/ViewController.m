//
//  ViewController.m
//  PPAlertViewDemo
//
//  Created by chenliang on 12/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewController.h"
#import "ActivityViewController.h"
#import "HUDViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demos";
    self.dataArray = @[@"PPAlertView",@"PPActivityView",@"PPHUD"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    switch (index) {
        case 0:{
           AlertViewController *avc = [[AlertViewController alloc]init];
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        case 1:{
            ActivityViewController *avc = [[ActivityViewController alloc]init];
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        case 2:{
            HUDViewController *hvc = [[HUDViewController alloc]init];
            [self.navigationController pushViewController:hvc animated:YES];
        }
            break;
        default:
            break;
    }
    
}

@end
