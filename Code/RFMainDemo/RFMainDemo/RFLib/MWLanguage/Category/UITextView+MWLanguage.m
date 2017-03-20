//
//  UITextView+MWLanguage.m
//  MWLanguage
//
//  Created by huangJiong on 2017/3/20.
//  Copyright © 2017年 miwu. All rights reserved.
//

#import "UITextView+MWLanguage.h"
#import "MWLanguage.h"

@implementation UITextView (MWLanguage)
- (void)setLocalizedTextKey:(NSString *)localizedTextKey {
    self.text = MWLocalizedString(localizedTextKey);
}
- (NSString *)localizedTextKey {
    return nil;
}
@end
