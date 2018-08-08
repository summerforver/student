//
//  StudentTableViewCell.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentTableViewCell : UITableViewCell


@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *classLabel;
@property (nonatomic, strong)UILabel *sexLabel;
@property (nonatomic, strong)UILabel *scoreLabel;

@property (nonatomic, strong)UILabel *nameMessageLabel;
@property (nonatomic, strong)UILabel *numberMessageLabel;
@property (nonatomic, strong)UILabel *classMessageLabel;
@property (nonatomic, strong)UILabel *sexMessageLabel;
@property (nonatomic, strong)UILabel *scoreMessageLabel;


@end
