//
//  StudentMessage.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentMessage : NSObject 
@property (nonatomic, copy)NSString *nameString, *numberString, *classString, *sexString, *scoreString;
- (instancetype)initWithName:(NSString *)name addNumber:(NSString *)number addClass:(NSString *)clas addSex:(NSString *)sex addScore:(NSString *)score;
- (BOOL)isPureInt:(NSString *)string;
- (BOOL)chickName:(NSString *)namestring andNumber:(NSString *)numberstring addClass:(NSString *)classstring addSex:(NSString *)sexstring addScore:(NSString *)scorestring;


@end
