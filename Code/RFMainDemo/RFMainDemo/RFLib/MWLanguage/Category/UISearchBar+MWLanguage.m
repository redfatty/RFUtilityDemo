//
//  UISearchBar+MWLanguage.m
//  MWLanguage
//
//  Created by huangJiong on 2017/3/20.
//  Copyright © 2017年 miwu. All rights reserved.
//

#import "UISearchBar+MWLanguage.h"
#import "MWLanguage.h"

@implementation UISearchBar (MWLanguage)
- (void)setLocalizedTextKey:(NSString *)localizedTextKey {
    self.text = MWLocalizedString(localizedTextKey);
}
- (NSString *)localizedTextKey {
    return nil;
}

- (void)setLocalizedPlaceholderKey:(NSString *)localizedPlaceholderKey {
    self.placeholder = MWLocalizedString(localizedPlaceholderKey);
}
- (NSString *)localizedPlaceholderKey {
    return nil;
}
@end
