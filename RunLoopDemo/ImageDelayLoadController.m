//
//  ImageDelayLoadController.m
//  RunLoopDemo
//
//  Created by MrChen on 2020/1/5.
//  Copyright © 2020 MrChen. All rights reserved.
//

#import "ImageDelayLoadController.h"
#import "ImageDelayCell.h"

@interface ImageDelayLoadController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ImageDelayLoadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentify = @"cellIdentify";
    
    ImageDelayCell *cell = [[ImageDelayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    
    // 移除cell上所有视图，重新创建添加，为了最大的消耗性能
    [cell.imageView1 removeFromSuperview];
    [cell.imageView2 removeFromSuperview];
    [cell.imageView3 removeFromSuperview];
    
    [cell addImageView1];
    [cell addImageView2];
    [cell addImageView3];
    
    return cell;
}

// cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark - UITableViewDelegate
// click row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
