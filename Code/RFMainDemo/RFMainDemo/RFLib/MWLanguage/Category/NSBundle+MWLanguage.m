//
//  NSBundle+MWLanguage.m
//  MWLanguage
//
//  Created by huangJiong on 16/12/9.
//  Copyright © 2016年 miwu. All rights reserved.
//

#import "NSBundle+MWLanguage.h"

@implementation NSBundle (MWLanguage)

+ (NSBundle *)localizedBundleInSuperBundle:(NSBundle *)superBundle forLanguage:(AppLanguage)language {
    NSString *localizedBundleName = nil;
    switch (language) {
        case AppLanguageChineseSimplified:
            localizedBundleName = @"zh-Hans";
            break;
        case AppLanguageChineseTraditional:
            localizedBundleName = @"zh-Hant";
            break;
        case AppLanguageJapanese:
            localizedBundleName = @"ja";
            break;
        case AppLanguageKorean:
            localizedBundleName = @"ko";
            break;
        case AppLanguageEnglish:
            localizedBundleName = @"en";
        default:
            localizedBundleName = @"Base";
            break;
    }
    
    if (superBundle == nil) {
        superBundle = [NSBundle mainBundle];
    }
    
    NSString *localizedBundlePath = [superBundle pathForResource:localizedBundleName ofType:@"lproj"];
    NSBundle *localizedBundle = [NSBundle bundleWithPath:localizedBundlePath];
    return localizedBundle;
}

@end
