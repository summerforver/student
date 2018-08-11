//
//  StudentMessage.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "StudentMessage.h"

@implementation StudentMessage

- (instancetype)initWithName:(NSString *)name addNumber:(NSString *)number addClass:(NSString *)clas addSex:(NSString *)sex addScore:(NSString *)score {
    self = [super init];
    if (self) {
        _nameString = name;
        _numberString = number;
        _classString = clas;
        _sexString = sex;
        _scoreString = score;
    }
    return  self;
}

- (BOOL)isPureInt:(NSString *)string{

    NSScanner* scan = [NSScanner scannerWithString:string];

    int val;

    return [scan scanInt:&val] && [scan isAtEnd];

}

- (BOOL)chickName:(NSString *)namestring andNumber:(NSString *)numberstring addClass:(NSString *)classstring addSex:(NSString *)sexstring addScore:(NSString *)scorestring {
    if (_nameString.length > 1 && _nameString.length < 10 && ![self isPureInt:_nameString] && [self isPureInt:_numberString] && _numberString.length == 8 && [self isPureInt:_scoreString] && ([_scoreString intValue] > 0 && [_scoreString intValue] <= 100)) {
        return YES;
    }
    return NO;
}

@end
