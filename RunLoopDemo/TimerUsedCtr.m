//
//  TimerUsedCtr.m
//  RunLoopDemo
//
//  Created by MrChen on 2020/1/5.
//  Copyright © 2020 MrChen. All rights reserved.
//

#import "TimerUsedCtr.h"

@interface TimerUsedCtr ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimerUsedCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTextView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 停止计时器
    [self.timer invalidate];
    // 计时器置空
    self.timer = nil;
    
}

// 添加可滚动的textView
- (void)addTextView
{
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 20, 200, 200)];
       textView.text = @"滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图滚动试图";
       [self.view addSubview:textView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.timer == nil) {
        // 创建计时器
        self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        // 添加到RunLoop的kCFRunLoopDefaultMode
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        // 添加到RunLoop的kCFRunLoopDefaultMode和UITrackingRunLoopMode
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:UITrackingRunLoopMode];
        // 添加到RunLoop的NSRunLoopCommonModes
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

// 计时器调用事件
- (void)timerAction
{
    NSDate *date = [NSDate date];
    NSLog(@"date:%@",date);
}

@end
