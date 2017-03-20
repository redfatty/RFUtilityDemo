//
//  MWLanguage.m
//  MWLanguage
//
//  Created by huangJiong on 16/6/1.
//  Copyright © 2016年 miwu. All rights reserved.
//

#import "MWLanguage.h"
#import "NSBundle+MWLanguage.h"


static NSString *const kAppLanguageBundleNameKey = @"AppLanguageBundleNameKey";


@implementation MWLanguage

static NSBundle *languageBundle_ = nil;
static AppLanguage defaultLanguage_ = AppLanguageEnglish;

//通过 key 获取对应的本地化字符串
+ (NSString *)localizedStringForKey:(NSString *)key {
    if (languageBundle_ == nil) {
        [self initAppLanguageWithDefault:defaultLanguage_];
    }
    
    static NSString *languageTable = @"MWLanguage";
    NSString *localizedStr = [languageBundle_ localizedStringForKey:key value:nil table:languageTable];
    if (localizedStr) {
        return localizedStr;
    }
    
    return key;
}

+ (void)initAppLanguageWithDefault:(AppLanguage)defaultLanguage {
    defaultLanguage_ = defaultLanguage;
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    //MWLanguage.strings文件跟MWLanguage.m类文件在同一目录下, 所以取self.class
    NSBundle *superBundle = [NSBundle bundleForClass:self.class];
    //先判断之前是否保存过包名, 保存过则说明设置过语言, 没保存过则说明没有设置过
    NSString *languageBundleName = [userDef stringForKey:kAppLanguageBundleNameKey];
    
    //1.已经设置过app语言了
    //1.1设置过支持的语言
    if ([languageBundleName isEqualToString:@"en"] ||
        [languageBundleName isEqualToString:@"zh-Hans"] ||
        [languageBundleName isEqualToString:@"zh-Hant"] ||
        [languageBundleName isEqualToString:@"ja"] ||
        [languageBundleName isEqualToString:@"ko"]) {
        
        NSString *languageBundlePath = [superBundle pathForResource:languageBundleName ofType:@"lproj"];
        languageBundle_ = [NSBundle bundleWithPath:languageBundlePath];
        return;
    }
    //1.2设置过不支持的语言
    if (languageBundleName.length) {
        languageBundle_ = [NSBundle localizedBundleInSuperBundle:superBundle forLanguage:defaultLanguage];
        return;
    }
    
    //2.还没有设置过app语言
    //2.1 bundle
    AppLanguage systemLanguage = [self currentSystemLanguage];
    if (systemLanguage == AppLanguageUnsupported) {
        systemLanguage = defaultLanguage_;
    }
    languageBundle_ = [NSBundle localizedBundleInSuperBundle:superBundle forLanguage:systemLanguage];
    //2.2 再设置语言
    [self setAppLanguage:systemLanguage];
}

//设置app语言
+ (void)setAppLanguage:(AppLanguage)language {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSString *languageBundleName = [userDef stringForKey:kAppLanguageBundleNameKey];
    AppLanguage curAppLan = [self currentAppLanguage];
    
    //1.已经设置过app语言,且已经设置的跟待设置的相同, 则不作处理
    if (curAppLan == language && languageBundleName.length) {
        return;
    }
    
    //2.重置
    //2.1保存bundleName
    switch (language) {
        case AppLanguageChineseSimplified:
            languageBundleName = @"zh-Hans";
            break;
        case AppLanguageChineseTraditional:
            languageBundleName = @"zh-Hant";
            break;
        case AppLanguageJapanese:
            languageBundleName = @"ja";
            break;
        case AppLanguageKorean:
            languageBundleName = @"ko";
            break;
        case AppLanguageEnglish:
            languageBundleName = @"en";
        case AppLanguageUnsupported:
        default:
            languageBundleName = @"unsupported";
            break;
    }
    
    [userDef setObject:languageBundleName forKey:kAppLanguageBundleNameKey];
    [userDef synchronize];
    //2.2重置bundle
    NSBundle *superBundle = [NSBundle bundleForClass:self.class];
    languageBundle_ = [NSBundle localizedBundleInSuperBundle:superBundle forLanguage:language];

    //3.通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kAppLanguageDidChangedNotification object:nil];
}

//获取当前app的语言
+ (AppLanguage)currentAppLanguage {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *languageBundleName = [userDefaults stringForKey:kAppLanguageBundleNameKey];
    
    //1.没有设置过app语言, 则默认返回系统首选语言
    if (!languageBundleName.length) {
        return [self currentSystemLanguage];
    }
    
    //2.已经设置过app语言
    if ([languageBundleName isEqualToString:@"en"]) {
        return AppLanguageEnglish;
    }
    else if ([languageBundleName isEqualToString:@"zh-Hans"]) {
        return AppLanguageChineseSimplified;
    }
    else if ([languageBundleName isEqualToString:@"zh-Hant"]) {
        return AppLanguageChineseTraditional;
    }
    else if ([languageBundleName isEqualToString:@"ja"]) {
        return AppLanguageJapanese;
    }
    else if ([languageBundleName isEqualToString:@"ko"]) {
        return AppLanguageKorean;
    }
    else {
        return AppLanguageUnsupported;
    }
}

//获取当前系统语言
+ (AppLanguage)currentSystemLanguage {
    NSArray *languageArr = [NSLocale preferredLanguages];
    NSString *firstLanguage = languageArr.firstObject;
    
    if ([firstLanguage hasPrefix:@"en"]) {
        return AppLanguageEnglish;
    }
    else if ([firstLanguage hasPrefix:@"zh-Hans"]//简体
             || [firstLanguage hasPrefix:@"yue-Hans"] //粤语简体
             ) {
        return AppLanguageChineseSimplified;
    }
    else if ([firstLanguage hasPrefix:@"zh-Hant"]//繁体
             || [firstLanguage hasPrefix:@"zh-TW"]//台湾
             || [firstLanguage hasPrefix:@"zh-HK"]//香港
             || [firstLanguage hasPrefix:@"yue-Hant"]//粤语繁体
             ) {
        return AppLanguageChineseTraditional;
    }
    else if ([firstLanguage hasPrefix:@"ja"]) {
        return AppLanguageJapanese;
    }
    else if ([firstLanguage hasPrefix:@"ko"]) {
        return AppLanguageKorean;
    }
    else {
        return AppLanguageUnsupported;
    }
}


@end




