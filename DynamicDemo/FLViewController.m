//
//  FLViewController.m
//  DynamicDemo
//
//  Created by Liu Feng on 13-12-24.
//  Copyright (c) 2013年 Liu Feng. All rights reserved.
//

#import "FLViewController.h"
#import "FLDemoViewController.h"

@interface FLViewController ()
{
    NSArray *_functions; // 记录所有功能
}
@end

@implementation FLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _functions = @[@"吸附行为", @"推动行为", @"刚性附着行为"];
}

#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _functions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = _functions[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - tableView代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FLDemoViewController *demoVC = [[FLDemoViewController alloc] init];
    demoVC.title = _functions[indexPath.row];
    demoVC.type = indexPath.row;

    [self.navigationController pushViewController:demoVC animated:YES];
}

@end
