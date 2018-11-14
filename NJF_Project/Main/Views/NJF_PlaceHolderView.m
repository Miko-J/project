//
//  NJF_PlaceHolderView.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/11/14.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_PlaceHolderView.h"
#import "Masonry.h"

@implementation NJF_PlaceHolderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    [self addSubview:self.placeHolderImageView];
    [self.placeHolderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self addSubview:self.placeHolderLable];
    [self.placeHolderLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.placeHolderImageView.mas_bottom).offset(10);
        make.centerX.equalTo(self);
    }];
}

- (void)setMarginToTop:(NSInteger)marginToTop{
    [self.placeHolderImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(marginToTop);
        make.centerX.equalTo(self);
    }];
}

#pragma mark - lazy loading

- (UIImageView *)placeHolderImageView{
    if (!_placeHolderImageView) {
        _placeHolderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"note"]];
    }
    return _placeHolderImageView;
}

- (UILabel *)placeHolderLable{
    if (!_placeHolderLable) {
        _placeHolderLable = [[UILabel alloc] init];
        _placeHolderLable.text = @"暂无数据";
        _placeHolderLable.textColor = [UIColor lightGrayColor];
        _placeHolderLable.font = [UIFont systemFontOfSize:15];
    }
    return _placeHolderLable;
}

@end
