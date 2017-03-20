//
//  MWLanguage.h
//  MWLanguage
//
//  Created by huangJiong on 16/6/1.
//  Copyright © 2016年 miwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWLanguageConst.h"



@interface MWLanguage : NSObject

/// 通过key获取本地化字符串
+ (NSString *)localizedStringForKey:(NSString *)key;
#define MWLocalizedString(key) [MWLanguage localizedStringForKey:(key)]

/// 初始化app默认语言, 初始默认语言为英语
+ (void)initAppLanguageWithDefault:(AppLanguage)defaultLanguage;

/// 设置App语言
+ (void)setAppLanguage:(AppLanguage)language;

/// 当前App语言
+ (AppLanguage)currentAppLanguage;

@end

