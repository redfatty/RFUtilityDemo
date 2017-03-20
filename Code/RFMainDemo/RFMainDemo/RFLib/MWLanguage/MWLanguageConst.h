//
//  MWLanguageConst.h
//  MWLanguage
//
//  Created by huangJiong on 16/12/9.
//  Copyright © 2016年 miwu. All rights reserved.
//

#ifndef MWLanguageConst_h
#define MWLanguageConst_h

#define kAppLanguageDidChangedNotification @"AppLanguageDidChangedNotification"

/// app语言
typedef NS_ENUM(NSInteger, AppLanguage) {
    AppLanguageUnsupported  = -1,   //不支持
    AppLanguageEnglish      =  0,   //英语
    AppLanguageChineseSimplified,   //中文简体
    AppLanguageChineseTraditional,  //中文繁体
    AppLanguageJapanese,            //日语
    AppLanguageKorean,              //韩语
    //...
};


#endif /* MWLanguageConst_h */
