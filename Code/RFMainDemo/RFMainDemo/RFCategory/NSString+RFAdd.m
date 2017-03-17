//
//  NSString+RFAdd.m
//  RFMainDemo
//
//  Created by huangJiong on 2017/3/17.
//  Copyright © 2017年 huangjiong. All rights reserved.
//

#import "NSString+RFAdd.h"

@implementation NSString (RFAdd)

//TODO:待完善
- (BOOL)validateInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
    //    NSString* number=@"\\d";
    //    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    //    return [numberPre evaluateWithObject:self];
}

//TODO:待完善
- (BOOL)validateFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (NSString *)convertToIntString {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if (!str.length) {
        return str;
    }
    
    if ([str validateInt]) {
        return str;
    }
    
    while ([str validateInt] == NO && str.length) {
        str = [[str substringToIndex:str.length - 1] convertToIntString];
    }
    return str;
}

- (NSString *)convertToFloatStringWithDecimalDigits:(NSInteger)decimalDigits {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if (!str.length) {
        return str;
    }
    
    if ([str validateFloat]) {
        NSUInteger pointLoc = [str rangeOfString:@"."].location;
        //没小数点
        if (pointLoc == NSNotFound) {
            return str;
        }
        //小数位没超
        if (str.length - pointLoc - 1 <= decimalDigits) {
            return str;
        }
        //超了
        str = [str substringToIndex:pointLoc + 1 + decimalDigits];
        return str;
    }
    
    while ([str validateFloat] == NO && str.length) {
        str = [[str substringToIndex:str.length - 1] convertToFloatStringWithDecimalDigits:decimalDigits];
    }
    return str;
}

- (NSString *)stringLimitMaxLenght:(NSInteger)maxLength retainLastChar:(BOOL)retainLastChar {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSInteger currentLength = str.length;
    if (currentLength <= maxLength) {
        return str;
    }
    
    if (retainLastChar) {
        NSString *lastChar = [str substringFromIndex:currentLength - 1];
        NSString *retainedStr = [str substringToIndex:maxLength - 1];
        return [NSString stringWithFormat:@"%@%@",retainedStr, lastChar];
    } else {
        return [str substringToIndex:maxLength];
    }
}


@end
