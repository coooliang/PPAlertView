//
//  TableViewController.m
//  PPAlertViewDemo
//
//  Created by chenliang on 17/10/2018.
//  Copyright © 2018 chenl. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = [self.dataArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = string;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end
