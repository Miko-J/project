//
//  UIBarButtonItem+NJF_Extension.h
//  NJF_Project
//
//  Created by niujf on 2018/11/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (NJF_Extension)

/**
 *  @param normalImg      正常的按钮图片
 *  @param highImg 高亮的按钮图片
 *  @param target         按钮响应目标
 *  @param action         按钮响应事件
 *  @return 返回自定义的barButtonItem
 */
+ (UIBarButtonItem *_Nonnull)barButtonItemWithNormalImg:(NSString * _Nullable)normalImg
                            HighlightedImg:(NSString * _Nullable)highImg
                                    target:(id)target
                                    action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
