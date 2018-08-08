//
//  ChangeTableViewCell.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ChangeTableViewCell.h"

@implementation ChangeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        _nameTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_nameTextField];
        
        _numberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberLabel];
        
        _numberTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_numberTextField];
        
        _classLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classLabel];
        
        _classTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_classTextField];
        
        _sexLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_sexLabel];
        
        _sexTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_sexTextField];
        
        _scoreLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_scoreLabel];
        
        _scoreTextField = [[UITextField alloc] init];
        [self.contentView addSubview:_scoreTextField];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _nameLabel.frame = CGRectMake(5, 10, 35, 30);
    _nameLabel.text = @"姓名:";
    [self setLabel:_nameLabel];
    
    _nameTextField.frame = CGRectMake(45, 10, 100, 30);
    [self setTextField:_nameTextField];
    
    _numberLabel.frame = CGRectMake(210, 10, 35, 30);
    _numberLabel.text = @"学号:";
    [self setLabel:_numberLabel];
    
    _numberTextField.frame = CGRectMake(250, 10, 100, 30);
    [self setTextField:_numberTextField];
    
    _classLabel.frame = CGRectMake(5, 55, 35, 30);
    _classLabel.text = @"班级:";
    [self setLabel:_classLabel];
    
    _classTextField.frame = CGRectMake(45, 55, 100, 30);
    [self setTextField:_classTextField];
    
    _sexLabel.frame = CGRectMake(160, 55, 35, 30);
    _sexLabel.text = @"性别:";
    [self setLabel:_sexLabel];
    
    _sexTextField.frame = CGRectMake(200, 55, 50, 30);
    [self setTextField:_sexTextField];
    
    _scoreLabel.frame = CGRectMake(260, 55, 35, 30);
    _scoreLabel.text = @"成绩:";
    [self setLabel:_scoreLabel];
    
    _scoreTextField.frame = CGRectMake(300, 55, 50, 30);
    [self setTextField:_scoreTextField];
}

- (void)setLabel:(UILabel *)label {
    label.textColor = [UIColor purpleColor];
    label.font = [UIFont systemFontOfSize:14.0];
}

- (void)setTextField:(UITextField *)textField {
    textField.font = [UIFont systemFontOfSize:14.0];
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.masksToBounds = YES;
    textField.layer.cornerRadius = 7;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
