//
//  UICollectionView+NJF_PlaceHolderView.h
//  NJF_Project
//
//  Created by jinfeng niu on 2018/11/14.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (NJF_PlaceHolderView)

/**
 是否启用 启动后无数据的时候展示站位图
 */
@property (nonatomic, assign) BOOL enablePlaceHolderView;
/**
 是否首次启用 首次启动显示加载中view
 */
@property (nonatomic, assign) BOOL firstReload;
/**
 占位文字
 */
@property (nonatomic, assign) NSString *placeHolderText;
/**
 占位图
 */
@property (nonatomic, assign) NSString *placeHolderImageName;
/**
 占位图距离顶部的距离
 */
@property (nonatomic, assign) NSInteger marginToTop;

/**
 自定义站位图只需赋值给这个view,如无需自定义忽略此属性
 */
@property (nonatomic, strong) UIView *NJF_PlaceHolderView;

@end
