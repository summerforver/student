//
//  ChangeViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ChangeViewController.h"
#import "ChangeTableViewCell.h"
#import "StudentTableViewCell.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"28.JPG"];
    [self.view addSubview:backgroundView];
    
    self.navigationItem.title= @"修改学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
    UILabel *changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 270, 30)];
    changeLabel.text = @"请输入你要修改的学生学号:";
    changeLabel.font = [UIFont systemFontOfSize:18.0];
    changeLabel.textColor = [UIColor colorWithRed:0.85f green:0.71f blue:0.00f alpha:1.00f];
    changeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:changeLabel];
    
    _changeTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 110, 270, 40)];
    _changeTextField.layer.masksToBounds = YES;
    _changeTextField.layer.cornerRadius = 7;
    _changeTextField.placeholder = @"请输入八位学号";
    _changeTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_changeTextField];
    
    UIButton *changeButton = [[UIButton alloc] initWithFrame:CGRectMake(310, 110, 50, 40)];
    [changeButton setTitle:@"搜索" forState:UIControlStateNormal];
    [changeButton setBackgroundColor:[UIColor orangeColor]];
    changeButton.layer.masksToBounds = YES;
    changeButton.layer.cornerRadius = 7;
    [changeButton addTarget:self action:@selector(pressChangeButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:changeButton];
    
    [self creatView];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change1:) name:@"change1" object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alert:) name:@"alert" object:nil];
    
}

- (void)showFrame {
    
    _nameLabel.frame = CGRectMake(20, 160, 60, 40);
    _nameTextField.frame = CGRectMake(100, 160, 200, 40);
    _numberLabel.frame = CGRectMake(20, 210, 60, 40);
    _numberTextLabel.frame = CGRectMake(100, 210, 200, 40);
    _classLabel.frame = CGRectMake(20, 260, 60, 40);
    _classTextField.frame = CGRectMake(100, 260, 200, 40);
    _sexLabel.frame = CGRectMake(20, 310, 60, 40);
    _label.frame = CGRectMake(100, 310, 50, 40);
    _rightButton.frame = CGRectMake(150, 310, 40, 40);
    _scoreLabel.frame = CGRectMake(20, 360, 60, 40);
    _scoreTextField.frame = CGRectMake(100, 360, 200, 40);
    _changeReallyButton.frame = CGRectMake(140, 410, 100, 40);
    
}

- (void)notShowFrame {
    _nameLabel.frame = CGRectMake(20, 160, 60, 0);
    _nameTextField.frame = CGRectMake(100, 160, 200, 0);
    _numberLabel.frame = CGRectMake(20, 210, 60, 0);
    _numberTextLabel.frame = CGRectMake(100, 210, 200, 0);
    _classLabel.frame = CGRectMake(20, 260, 60, 0);
    _classTextField.frame = CGRectMake(100, 260, 200, 0);
    _sexLabel.frame = CGRectMake(20, 310, 60, 0);
    _label.frame = CGRectMake(100, 310, 50, 0);
    _rightButton.frame = CGRectMake(150, 310, 40, 0);
    _scoreLabel.frame = CGRectMake(20, 360, 60, 0);
    _scoreTextField.frame = CGRectMake(100, 360, 200, 0);
    _changeReallyButton.frame = CGRectMake(140, 300, 100, 0);
}

- (void)creatView {
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.frame = CGRectMake(20, 160, 60, 0);
    _nameLabel.text = @"姓名:";
    _nameLabel.textColor = [UIColor purpleColor];
    _nameLabel.font = [UIFont systemFontOfSize:18.0];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 160, 200, 0)];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.layer.cornerRadius = 7;
    _nameTextField.backgroundColor = [UIColor whiteColor];
    
    
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.frame = CGRectMake(20, 210, 60, 0);
    _numberLabel.text = @"学号:";
    _numberLabel.textColor = [UIColor purpleColor];
    _numberLabel.font = [UIFont systemFontOfSize:18.0];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    
//    _numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 210, 200, 0)];
//    _numberTextField.layer.masksToBounds = YES;
//    _numberTextField.layer.cornerRadius = 7;
//    _numberTextField.backgroundColor = [UIColor whiteColor];
//    _numberTextField.placeholder = @"请输入八位学号";
    _numberTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 210, 200, 0)];
    _numberTextLabel.layer.masksToBounds = YES;
    _numberTextLabel.layer.cornerRadius = 7;
    _numberTextLabel.backgroundColor = [UIColor whiteColor];
//    _numberTextLabel.placeholder = @"请输入八位学号";
    
    _classLabel = [[UILabel alloc] init];
    _classLabel.frame = CGRectMake(20, 260, 60, 0);
    _classLabel.text = @"班级:";
    _classLabel.textColor = [UIColor purpleColor];
    _classLabel.font = [UIFont systemFontOfSize:18.0];
    _classLabel.textAlignment = NSTextAlignmentCenter;
    
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 260, 200, 0)];
    _classTextField.layer.masksToBounds = YES;
    _classTextField.layer.cornerRadius = 7;
    _classTextField.backgroundColor = [UIColor whiteColor];
    _classTextField.placeholder = @"专业+班级,例如:软件1704";
    
    _sexLabel = [[UILabel alloc] init];
    _sexLabel.frame = CGRectMake(20, 310, 60, 0);
    _sexLabel.text = @"性别:";
    _sexLabel.textColor = [UIColor purpleColor];
    _sexLabel.font = [UIFont systemFontOfSize:18.0];
    _sexLabel.textAlignment = NSTextAlignmentCenter;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 310, 50, 0)];
    _label.font = [UIFont systemFontOfSize:14.0];
    _label.layer.masksToBounds = YES;
    _label.layer.cornerRadius = 7;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_label];
    
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 310, 40, 0)];
    [_rightButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_rightButton];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(100, 350, 50, 0) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    _tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    
    _scoreLabel = [[UILabel alloc] init];
    _scoreLabel.frame = CGRectMake(20, 360, 60, 0);
    _scoreLabel.text = @"成绩:";
    _scoreLabel.textColor = [UIColor purpleColor];
    _scoreLabel.font = [UIFont systemFontOfSize:18.0];
    _scoreLabel.textAlignment = NSTextAlignmentCenter;
    
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 360, 200, 0)];
    _scoreTextField.layer.masksToBounds = YES;
    _scoreTextField.layer.cornerRadius = 7;
    _scoreTextField.backgroundColor = [UIColor whiteColor];
    _scoreTextField.placeholder = @"0～100";
    
    
    _changeReallyButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 410, 100, 0)];
    [_changeReallyButton setTitle:@"确认修改" forState:UIControlStateNormal];
    [_changeReallyButton setBackgroundColor:[UIColor orangeColor]];
    _changeReallyButton.layer.masksToBounds = YES;
    _changeReallyButton.layer.cornerRadius = 7;
    [_changeReallyButton addTarget:self action:@selector(pressChangeReallyButton:) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_numberLabel];
    [self.view addSubview:_numberTextLabel];
    [self.view addSubview:_classLabel];
    [self.view addSubview:_classTextField];
    [self.view addSubview:_sexLabel];
//    [self.view addSubview:_sexTextField];
    
    [self.view addSubview:_scoreLabel];
    [self.view addSubview:_scoreTextField];
    [self.view addSubview:_changeReallyButton];
    
    [self.view addSubview:_tableView];
    
   
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSArray *array = [NSArray arrayWithObjects:@"男", @"女", nil];
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    cell1.textLabel.text = array[indexPath.row];
    cell1.textLabel.font = [UIFont systemFontOfSize:14.0];
    
    return cell1;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        _label.text = @"男";
    } else {
        _label.text = @"女";
    }
    self.tableView.frame = CGRectMake(100, 350, 50, 0);
    self.isSticked = NO;
    
}



- (void)rightButton:(UIButton *)button {
    //    button.selected = !button.selected;
    
    self.isSticked = !self.isSticked;
    if (self.isSticked) {
        self.tableView.frame = CGRectMake(100, 350, 50, 60);
        
    } else{
        self.tableView.frame = CGRectMake(100, 350, 50, 0);
        
    }
    
}


- (void)pressChangeButton:(UIButton *)button {
    button.selected = !button.selected;
    
    //    NSDictionary *dict = @{@"deleteText":self.deleteTextField.text};
    //
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"delete" object:nil userInfo:dict];
    if (button.selected == YES) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认搜索" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            //            NSLog(@"action = %@", action);
            NSDictionary *dict = @{@"changeText":self.changeTextField.text};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"change" object:nil userInfo:dict];
        }];
        
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSLog(@"action = %@", action);
        }];
        
        [alert addAction:firstAction];
        [alert addAction:secondAction];
        
        alert.view.tintColor = [UIColor blackColor];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

- (void)pressChangeReallyButton:(UIButton *)button {
    button.selected = !button.selected;
    
    //    NSDictionary *dict = @{@"deleteText":self.deleteTextField.text};
    //
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"delete" object:nil userInfo:dict];
    if (button.selected == YES) {
        StudentMessage *student = [[StudentMessage alloc] initWithName:_nameTextField.text addNumber:_numberTextLabel.text addClass:_classTextField.text addSex:_label.text addScore:_scoreTextField.text];
        if ([student chickName:_nameTextField.text andNumber:_numberTextLabel.text addClass:_classTextField.text addSex:_label.text addScore:_scoreTextField.text]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认修改" message:@"请确定是否修改" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                //响应事件
                //            NSLog(@"action = %@", action);
                NSDictionary *dict = @{@"nameChText":self.nameTextField.text, @"numberChText":self.numberTextLabel.text, @"classChText":self.classTextField.text, @"sexChText":self.label.text, @"scoreChText":self.scoreTextField.text};
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"changeReally" object:nil userInfo:dict];
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改成功" message:@"请在显示页面查看" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    //响应事件
                    NSLog(@"action = %@", action);
                    
                }];
                
                UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    NSLog(@"action = %@", action);
                }];
                
                [alert addAction:firstAction];
                [alert addAction:secondAction];
                
                alert.view.tintColor = [UIColor blackColor];
                [self presentViewController:alert animated:YES completion:nil];
                
                
            }];
            
            UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                NSLog(@"action = %@", action);
            }];
            
            [alert addAction:firstAction];
            [alert addAction:secondAction];
            
            alert.view.tintColor = [UIColor blackColor];
            [self presentViewController:alert animated:YES completion:nil];
            
             button.selected = NO;
        }
    } else {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"输入的信息不合法哟" message:@"请根据提示重新输入" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *firstAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
//            self.scoreTextField.text = @"";
//            self.label.text = @"";
//            self.classTextField.text = @"";
//            self.numberTextField.text = @"";
//            self.nameTextField.text = @"";
        }];
        
        [alert1 addAction:firstAction1];
        
        alert1.view.tintColor = [UIColor blackColor];
        [self presentViewController:alert1 animated:YES completion:nil];
    }
   
    
}

//- (void)alert:(NSNotification *)text {
//    self.changeTextField.text = text.userInfo[@"alert"];
//
//}


- (void)change1:(NSNotification *)text {
    //    NSLog(@"%@",text.userInfo[@"nameText"]);
    _a = [[StudentMessage alloc] init];
    _a = text.userInfo[@"studentChangeMessage"];
    
    if ([_a.numberString isEqualToString:self.changeTextField.text]) {
        self.nameTextField.text = _a.nameString;
        self.numberTextLabel.text = _a.numberString;
        self.classTextField.text = _a.classString;
        self.label.text = _a.sexString;
        self.scoreTextField.text = _a.scoreString;
        [self showFrame];
        
//        self.tableView.frame = CGRectMake(5, 180, 365, 100);
//        self.changeReallyButton.frame = CGRectMake(140, 300, 100, 40);
    } else {
//        self.tableView.frame = CGRectMake(5, 180, 365, 0);
//        self.changeReallyButton.frame = CGRectMake(140, 300, 100, 0);
        [self notShowFrame];
    }
    
    //    _a.nameString = text.userInfo[@"nameText"];
}


- (void)viewDidDisappear:(BOOL)animated {
    _changeTextField.text = @"";
    [self notShowFrame];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
