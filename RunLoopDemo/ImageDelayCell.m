//
//  ImageDelayCell.m
//  RunLoopDemo
//
//  Created by MrChen on 2020/1/5.
//  Copyright © 2020 MrChen. All rights reserved.
//

#import "ImageDelayCell.h"

@implementation ImageDelayCell

/**
 * 添加第一张图片
 */
- (void)addImageView1
{
    self.imageView1 = [self createImageView:0];
    [self setImageView:@"image1.jpg" imageView:self.imageView1];
    [self addImageView:self.imageView1 animated:YES];
}

/**
 * 添加第二张图片
 */
- (void)addImageView2
{
    self.imageView2 = [self createImageView:1];
    [self setImageView:@"image2.jpg" imageView:self.imageView2];
    [self addImageView:self.imageView2 animated:YES];
}

/**
 * 添加第三张图片
 */
- (void)addImageView3
{
    self.imageView3 = [self createImageView:2];
    [self setImageView:@"image3.jpg" imageView:self.imageView3];
    [self addImageView:self.imageView3 animated:YES];
}

/**
 * 创建ImageView
 */
- (UIImageView *)createImageView:(NSInteger)index
{
    CGFloat margin = 10.0;
    CGFloat y = 5.0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width/3;
    CGFloat x = (w + margin) * index;
    CGFloat h = 60;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    return imageView;
}

/**
 * 添加imageView
 */
- (void)addImageView:(UIImageView *)imageView animated:(BOOL)animated
{
    if (animated) {
        [UIView transitionWithView:imageView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.contentView addSubview:imageView];
        } completion:nil];
    }else {
        [self.contentView addSubview:imageView];
    }
}

/**
 * 设置图片
 */
-(void)setImageView:(NSString *)imageName imageView:(UIImageView *)imageView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    // 直接加载图片会导致界面卡顿
//    imageView.image = image;
    
    // 设置图片在NSDefaultRunLoopMode模式下延迟加载，解决界面卡顿
    [imageView performSelector:@selector(setImage:) withObject:image afterDelay:2.0 inModes:@[NSDefaultRunLoopMode]];
}

@end
