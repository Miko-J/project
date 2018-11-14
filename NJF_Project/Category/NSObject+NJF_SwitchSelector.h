//
//  NSObject+NJF_SwitchSelector.h
//  NJF_Project
//
//  Created by jinfeng niu on 2018/11/14.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NJF_SwitchSelector)

/**
 *  交换对象方法
 *
 *  @param origSelector    原有方法
 *  @param swizzleSelector 现有方法(自己实现方法)
 */
+ (void)swizzleInstanceSelector:(SEL)origSelector
                swizzleSelector:(SEL)swizzleSelector;

/**
 *  交换类方法
 *
 *  @param origSelector    原有方法
 *  @param swizzleSelector 现有方法(自己实现方法)
 */
+ (void)swizzleClassSelector:(SEL)origSelector
             swizzleSelector:(SEL)swizzleSelector;

@end
