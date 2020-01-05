//
//  ImagesScrollController.m
//  RunLoopDemo
//
//  Created by MrChen on 2020/1/5.
//  Copyright © 2020 MrChen. All rights reserved.
//

#import "ImagesScrollController.h"

@interface ImagesScrollController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ImagesScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"图片轮播器";
    
    [self addImages];
    [self addTimer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 计时器停止
    [self.timer invalidate];
    // 计时器置空
    self.timer = nil;
}

// 添加图片
- (void)addImages
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - 320) * 0.5, 200, 320, 222)];
    NSArray *images = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i * 320, 0, 320, 222)];
        imageV.image = [UIImage imageNamed:images[i]];
        [self.scrollView addSubview:imageV];
    }
    self.scrollView.contentSize = CGSizeMake(320 * 5, 222);
    [self.scrollView setPagingEnabled:YES];
    [self.view addSubview:self.scrollView];
}

// 添加计时器
- (void)addTimer
{
    // 创建计时器
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    // 添加到RunLoop的kCFRunLoopDefaultMode
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

// 计时器事件
- (void)timerAction
{
    CGPoint offset = self.scrollView.contentOffset;
    if (offset.x == 320 * 4) {
        offset.x = 0;
    }else {
        offset.x += 320;
    }

    [self.scrollView setContentOffset:offset animated:YES];
    
    NSDate *date = [NSDate date];
    NSLog(@"----%@",date);
}

@end
