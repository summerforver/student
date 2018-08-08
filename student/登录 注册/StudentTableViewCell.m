//
//  StudentTableViewCell.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "StudentTableViewCell.h"

@implementation StudentTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];

        _nameMessageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameMessageLabel];
        
        _numberLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberLabel];
        
        _numberMessageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_numberMessageLabel];
        
        _classLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classLabel];
        
        _classMessageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_classMessageLabel];
        
        _sexLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_sexLabel];
        
        _sexMessageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_sexMessageLabel];
        
        _scoreLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_scoreLabel];
        
        _scoreMessageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_scoreMessageLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _nameLabel.frame = CGRectMake(10, 10, 50, 30);
    _nameLabel.text = @"姓名:";
    _nameLabel.textColor = [UIColor purpleColor];
    _nameLabel.font = [UIFont systemFontOfSize:15.0];
    
    _nameMessageLabel.frame = CGRectMake(65, 10, 100, 30);
    _nameMessageLabel.font = [UIFont systemFontOfSize:14.0];
    
    _numberLabel.frame = CGRectMake(210, 10, 50, 30);
    _numberLabel.text = @"学号:";
    _numberLabel.textColor = [UIColor purpleColor];
    _numberLabel.font = [UIFont systemFontOfSize:15.0];
    
    _numberMessageLabel.frame = CGRectMake(265, 10, 100, 30);
    _numberMessageLabel.font = [UIFont systemFontOfSize:14.0];
    
    _classLabel.frame = CGRectMake(10, 55, 50, 30);
    _classLabel.text = @"班级:";
    _classLabel.textColor = [UIColor purpleColor];
    _classLabel.font = [UIFont systemFontOfSize:15.0];
    
    _classMessageLabel.frame = CGRectMake(65, 55, 100, 30);
    _classMessageLabel.font = [UIFont systemFontOfSize:14.0];
    
    _sexLabel.frame = CGRectMake(170, 55, 40, 30);
    _sexLabel.text = @"性别:";
    _sexLabel.textColor = [UIColor purpleColor];
    _sexLabel.font = [UIFont systemFontOfSize:15.0];
    
    _sexMessageLabel.frame = CGRectMake(215, 55, 30, 30);
    _sexMessageLabel.font = [UIFont systemFontOfSize:14.0];
    
    _scoreLabel.frame = CGRectMake(270, 55, 40, 30);
    _scoreLabel.text = @"成绩:";
    _scoreLabel.textColor = [UIColor purpleColor];
    _scoreLabel.font = [UIFont systemFontOfSize:15.0];
    
    _scoreMessageLabel.frame = CGRectMake(315, 55, 50, 30);
    _scoreMessageLabel.font = [UIFont systemFontOfSize:14.0];
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
