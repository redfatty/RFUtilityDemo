//
//  UIButton+MWLanguage.m
//  MWLanguage
//
//  Created by huangJiong on 2017/3/20.
//  Copyright © 2017年 miwu. All rights reserved.
//

#import "UIButton+MWLanguage.h"
#import "MWLanguage.h"

@implementation UIButton (MWLanguage)
- (void)setLocalizedNormalTitleKey:(NSString *)localizedNormalTitleKey {
    [self setTitle:MWLocalizedString(localizedNormalTitleKey) forState:UIControlStateNormal];
}
- (NSString *)localizedNormalTitleKey {
    return nil;
}

- (void)setLocalizedSelectedTitleKey:(NSString *)localizedSelectedTitleKey {
    [self setTitle:MWLocalizedString(localizedSelectedTitleKey) forState:UIControlStateSelected];
}
- (NSString *)localizedSelectedTitleKey {
    return nil;
}
@end
