//
//  ChangeViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMessage.h"

@interface ChangeViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UILabel *nameLabel;
@property(nonatomic, strong)UILabel *numberLabel;
@property(nonatomic, strong)UILabel *classLabel;
@property(nonatomic, strong)UILabel *sexLabel;
@property(nonatomic, strong)UILabel *scoreLabel;

@property (nonatomic, strong)UITextField *nameTextField;
//@property (nonatomic, strong)UITextField *numberTextField;
@property (nonatomic, strong)UILabel *numberTextLabel;
@property (nonatomic, strong)UITextField *classTextField;
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UITextField *scoreTextField;

@property (nonatomic, strong)UIButton *rightButton;
@property (nonatomic, strong)UITableView *tableView;
//@property (nonatomic, strong)UITableView *firstTableView;
//@property (nonatomic, strong)UITableView *secondTableView;
@property (nonatomic, strong)UITextField *changeTextField;
@property (nonatomic, strong)UIButton *changeReallyButton;
@property StudentMessage *a;
@property BOOL isSticked;
//@property (nonatomic, strong)UITextField *nameTextField;
//@property (nonatomic, strong)UITextField *numTextField;
//@property (nonatomic, strong)UITextField *classTextField;
//@property (nonatomic, strong)UITextField *sexTextField;
//@property (nonatomic, strong)UITextField *scoreTextField;

@end
