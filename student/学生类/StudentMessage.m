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

@end
