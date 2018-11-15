//
//  NJF_HomeController.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeController.h"
#import "SGPageTitleView.h"
#import "SGPageContentScrollView.h"
#import "SGPageContentCollectionView.h"
#import "SGPageTitleViewConfigure.h"
#import "UIColor+NJF_Color.h"
#import "NJF_HomeLatestTableController.h"

@interface NJF_HomeController ()<SGPageTitleViewDelegate, SGPageContentCollectionViewDelegate>

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentCollectionView *pageContentCollectionView;

@end

@implementation NJF_HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupPageView];
}

- (void)setupPageView {
    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat pageTitleViewY = 0;
    if (statusHeight == 20.0) {
        pageTitleViewY = 64;
    } else {
        pageTitleViewY = 88;
    }
    NSArray *titleArr = @[@"最新", @"公告", @"活动", @"攻略"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = [UIColor lightGrayColor];
    configure.titleSelectedColor = [UIColor colorWithHexString:@"13227a"];
    configure.indicatorColor = [UIColor colorWithHexString:@"13227a"];
    configure.indicatorAdditionalWidth = 80; // 说明：指示器额外增加的宽度，不设置，指示器宽度为标题文字宽度；若设置无限大，则指示器宽度为按钮宽度
    configure.titleGradientEffect = YES;
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    NSMutableArray *childArr = [NSMutableArray array];
    NJF_HomeLatestTableController *homeLatestVC = [[NJF_HomeLatestTableController alloc] init];
    [childArr addObject:homeLatestVC];
    for (int i = 0; i < 3; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        [childArr addObject:vc];
    }
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentCollectionView = [[SGPageContentCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:childArr];
    _pageContentCollectionView.delegatePageContentCollectionView = self;
    [self.view addSubview:_pageContentCollectionView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentCollectionView setPageContentCollectionViewCurrentIndex:selectedIndex];
}

- (void)pageContentCollectionView:(SGPageContentCollectionView *)pageContentCollectionView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

@end
