//
//  NSBundle+MWLanguage.h
//  MWLanguage
//
//  Created by huangJiong on 16/12/9.
//  Copyright © 2016年 miwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWLanguageConst.h"

@interface NSBundle (MWLanguage)

+ (NSBundle *)localizedBundleInSuperBundle:(NSBundle *)superBundle
                               forLanguage:(AppLanguage)language;

@end
