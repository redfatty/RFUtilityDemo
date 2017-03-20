//
//  UITextField+MWLanguage.h
//  MWLanguage
//
//  Created by huangJiong on 2017/3/20.
//  Copyright © 2017年 miwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (MWLanguage)
@property (nonatomic, copy) NSString *localizedTextKey;//text
@property (nonatomic, copy) NSString *localizedPlaceholderKey;//placeholder
@end
