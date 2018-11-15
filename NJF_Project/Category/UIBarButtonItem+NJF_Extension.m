//
//  UIBarButtonItem+NJF_Extension.m
//  NJF_Project
//
//  Created by niujf on 2018/11/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "UIBarButtonItem+NJF_Extension.h"

@implementation UIBarButtonItem (NJF_Extension)

+ (UIBarButtonItem *_Nonnull)barButtonItemWithNormalImg:(NSString * _Nullable)normalImg
                            HighlightedImg:(NSString * _Nullable)highImg
                                    target:(id)target
                                    action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *norImage = [UIImage imageNamed:normalImg];
    [button setImage:norImage forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImg] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBounds:CGRectMake(0, 0, norImage.size.width, norImage.size.height)];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
