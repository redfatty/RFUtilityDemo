//
//  UILabel+MWLanguage.m
//  MWLanguage
//
//  Created by huangJiong on 2017/3/20.
//  Copyright © 2017年 miwu. All rights reserved.
//

#import "UILabel+MWLanguage.h"
#import "MWLanguage.h"

@implementation UILabel (MWLanguage)
- (void)setLocalizedTextKey:(NSString *)localizedTextKey {
    self.text = MWLocalizedString(localizedTextKey);
}
- (NSString *)localizedTextKey {
    return nil;
}
@end
