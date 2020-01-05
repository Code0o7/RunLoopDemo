//
//  ResidentThreadController.m
//  RunLoopDemo
//
//  Created by MrChen on 2020/1/5.
//  Copyright © 2020 MrChen. All rights reserved.
//

#import "ResidentThreadController.h"

@interface ResidentThreadController ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation ResidentThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self createNewThread];
}

// 创建新线程
- (void)createNewThread
{
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
}

// 在新的线程内部获取线程的RunLoop对象，并给RunLoop添加事件保证线程不退出，也就实现了常驻线程
- (void)run
{
    NSLog(@"run=====%@",[NSThread currentThread]);
    
    // runloop如果没有CFRunLoopSourceRef事件源输入或者定时器，就会立马消亡。
    // 下面的方法给runloop添加一个NSport，就是添加一个事件源，也可以添加一个定时器，或者observer，让runloop不会挂掉
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    // 点击屏幕给常驻线程添加事件
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)test
{
    NSLog(@"=======%@",[NSThread currentThread]);
}

@end
