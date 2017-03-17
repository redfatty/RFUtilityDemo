//
//  NSString+RFAdd.h
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RFAdd)

/** 验证整数 */
- (BOOL)validateInt;

/** 验证浮点数 */
- (BOOL)validateFloat;


/** 转换成整数字符串 */
- (NSString *)convertToIntString;

/**
 转换成浮点数字符串
 
 @param decimalDigits 小数位数
 @return <#return value description#>
 */
- (NSString *)convertToFloatStringWithDecimalDigits:(NSInteger)decimalDigits;


/**
 子串,限制长度
 
 @param maxLength  最大长度
 @param retainLastChar 保留最后一个字符
 @return <#return value description#>
 */
- (NSString *)stringLimitMaxLenght:(NSInteger)maxLength retainLastChar:(BOOL)retainLastChar;

@end
