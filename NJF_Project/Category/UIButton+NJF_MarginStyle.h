//
//  UIButton+NJF_MarginStyle.h
//  NJF_Project
//
//  Created by niujf on 2018/11/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, NJF_ButtonEdgeInsetsStyle) {
    NJF_ButtonEdgeInsetsStyleTop, // image在上，label在下
    NJF_ButtonEdgeInsetsStyleLeft, // image在左，label在右
    NJF_ButtonEdgeInsetsStyleBottom, // image在下，label在上
    NJF_ButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (NJF_MarginStyle)

/**
 *  设置图片与文字样式
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 *  @param imagePositionBlock     在此 Block 中设置按钮的图片、文字以及 contentHorizontalAlignment 属性
 */
- (void)NJF_imagePositionStyle:(NJF_ButtonEdgeInsetsStyle)imagePositionStyle spacing:(CGFloat)spacing imagePositionBlock:(void (^)(UIButton *button))imagePositionBlock;

@end

NS_ASSUME_NONNULL_END
