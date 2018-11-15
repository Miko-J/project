//
//  NJF_HomeLatestTableController.m
//  NJF_Project
//
//  Created by niujf on 2018/11/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeLatestTableController.h"
#import "SDCycleScrollView.h"
#import "NJF_HomeWKWebController.h"

@interface NJF_HomeLatestTableController () <SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *headView;
@end

@implementation NJF_HomeLatestTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static  NSString *ID = @"Home_Latest_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - lazy loading

- (SDCycleScrollView *)headView{
    if (!_headView) {
        // 情景一：采用本地图片实现
        NSArray *imageNames = @[@"Home_1.jpg",
                                @"Home_2.jpg",
                                @"Home_3.jpg",
                                @"Home_4.jpg",
                                ];
        _headView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 180) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
        _headView.delegate = self;
        _headView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _headView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _headView.pageControlDotSize = CGSizeMake(8, 8);
        _headView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _headView;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSArray *urlArr = @[@"http://wzcq.xy.com/news/118580.html",@"http://wzcq.xy.com/news/118419.html",@"http://wzcq.xy.com/zl/113610.html",@"http://wzcq.xy.com/news/113268.html"];
    NJF_HomeWKWebController *vc = [[NJF_HomeWKWebController alloc] init];
    vc.loadUrl = urlArr[index];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
