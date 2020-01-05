//
//  ImageDelayCell.h
//  RunLoopDemo
//
//  Created by MrChen on 2020/1/5.
//  Copyright © 2020 MrChen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageDelayCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imageView1;

@property (nonatomic, strong) UIImageView *imageView2;

@property (nonatomic, strong) UIImageView *imageView3;

/**
 * 添加第一张图片
 */
- (void)addImageView1;

/**
 * 添加第二张图片
 */
- (void)addImageView2;

/**
 * 添加第三张图片
 */
- (void)addImageView3;
@end

NS_ASSUME_NONNULL_END
