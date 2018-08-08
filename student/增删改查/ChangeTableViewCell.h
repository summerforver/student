//
//  ChangeTableViewCell.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *classLabel;
@property (nonatomic, strong)UILabel *sexLabel;
@property (nonatomic, strong)UILabel *scoreLabel;

@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UITextField *numberTextField;
@property (nonatomic, strong)UITextField *classTextField;
@property (nonatomic, strong)UITextField *sexTextField;
@property (nonatomic, strong)UITextField *scoreTextField;

@end
