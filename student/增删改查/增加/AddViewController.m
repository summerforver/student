//
//  AddViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "AddViewController.h"
#import "StudentMessage.h"

@interface AddViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"11.JPG"];
    [self.view addSubview:backgroundView];
    
    self.navigationItem.title= @"增加学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
    
    
    
    [self creatView];
    
    
    
    
}

- (void)creatView {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 270, 40)];
    label.text = @"请输入你要增加的学生信息:";
    label.font = [UIFont systemFontOfSize:18.0];
    label.textColor = [UIColor colorWithRed:0.85f green:0.71f blue:0.00f alpha:1.00f];
    label.textAlignment = NSTextAlignmentCenter;
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(30, 120, 60, 40);
    nameLabel.text = @"姓名:";
    nameLabel.textColor = [UIColor purpleColor];
    nameLabel.font = [UIFont systemFontOfSize:18.0];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 120, 200, 40)];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.layer.cornerRadius = 7;
    _nameTextField.placeholder = @"请输入2～10位的姓名";
    _nameTextField.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.frame = CGRectMake(30, 170, 60, 40);
    numberLabel.text = @"学号:";
    numberLabel.textColor = [UIColor purpleColor];
    numberLabel.font = [UIFont systemFontOfSize:18.0];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    
    _numTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 170, 200, 40)];
    _numTextField.layer.masksToBounds = YES;
    _numTextField.layer.cornerRadius = 7;
    _numTextField.backgroundColor = [UIColor whiteColor];
    _numTextField.placeholder = @"请输入八位学号";
    
    UILabel *classLabel = [[UILabel alloc] init];
    classLabel.frame = CGRectMake(30, 220, 60, 40);
    classLabel.text = @"班级:";
    classLabel.textColor = [UIColor purpleColor];
    classLabel.font = [UIFont systemFontOfSize:18.0];
    classLabel.textAlignment = NSTextAlignmentCenter;
    
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 220, 200, 40)];
    _classTextField.layer.masksToBounds = YES;
    _classTextField.layer.cornerRadius = 7;
    _classTextField.backgroundColor = [UIColor whiteColor];
    _classTextField.placeholder = @"专业+班级,例如:软件1704";
    
    UILabel *sexLabel = [[UILabel alloc] init];
    sexLabel.frame = CGRectMake(30, 270, 60, 40);
    sexLabel.text = @"性别:";
    sexLabel.textColor = [UIColor purpleColor];
    sexLabel.font = [UIFont systemFontOfSize:18.0];
    sexLabel.textAlignment = NSTextAlignmentCenter;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(110, 270, 50, 40)];
    _label.font = [UIFont systemFontOfSize:14.0];
    _label.layer.masksToBounds = YES;
    _label.layer.cornerRadius = 7;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_label];
    
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 270, 40, 40)];
    [_rightButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_rightButton];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(110, 310, 50, 0) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    
    UILabel *scoreLabel = [[UILabel alloc] init];
    scoreLabel.frame = CGRectMake(30, 320, 60, 40);
    scoreLabel.text = @"成绩:";
    scoreLabel.textColor = [UIColor purpleColor];
    scoreLabel.font = [UIFont systemFontOfSize:18.0];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    
    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 320, 200, 40)];
    _scoreTextField.layer.masksToBounds = YES;
    _scoreTextField.layer.cornerRadius = 7;
    _scoreTextField.backgroundColor = [UIColor whiteColor];
    _scoreTextField.placeholder = @"0～100";
    
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 380, 100, 40)];
    [addButton setTitle:@"确认添加" forState:UIControlStateNormal];
    [addButton setBackgroundColor:[UIColor orangeColor]];
    addButton.layer.masksToBounds = YES;
    addButton.layer.cornerRadius = 7;
    [addButton addTarget:self action:@selector(pressAddButton:) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view addSubview:label];
    [self.view addSubview:nameLabel];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:numberLabel];
    [self.view addSubview:_numTextField];
    [self.view addSubview:classLabel];
    [self.view addSubview:_classTextField];
    [self.view addSubview:sexLabel];
    
    [self.view addSubview:scoreLabel];
    [self.view addSubview:_scoreTextField];
    [self.view addSubview:addButton];
    
    [self.view addSubview:_tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alert:) name:@"alert" object:nil];
    
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
    UITableViewCell *cell1 = nil;
    cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    NSArray *array = [NSArray arrayWithObjects:@"男", @"女", nil];
    if (cell1 == nil) {
        
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        cell1.textLabel.text = array[indexPath.row];
        cell1.textLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return cell1;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        _label.text = @"男";
    } else {
        _label.text = @"女";
    }
    self.tableView.frame = CGRectMake(110, 310, 50, 0);
    self.isSticked = NO;

}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [self.nameTextField becomeFirstResponder];
//    return YES;
//}

- (void)rightButton:(UIButton *)button {
    //    button.selected = !button.selected;
    
    self.isSticked = !self.isSticked;
    if (self.isSticked) {
        self.tableView.frame = CGRectMake(110, 310, 50, 60);
        
    } else{
        self.tableView.frame = CGRectMake(110, 310, 50, 0);
    
    }
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)pressAddButton:(UIButton *)button {
    
    button.selected = !button.selected;
    NSDictionary *dict = @{@"nameText":self.nameTextField.text, @"numText":self.numTextField.text, @"classText":self.classTextField.text, @"sexText":self.label.text, @"scoreText":self.scoreTextField.text};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"add" object:nil userInfo:dict];
    
    if (button.selected == YES) {
        StudentMessage *student = [[StudentMessage alloc] initWithName:_nameTextField.text addNumber:_numTextField.text addClass:_classTextField.text addSex:_label.text addScore:_scoreTextField.text];
        
        if ([student chickName:_nameTextField.text andNumber:_numTextField.text addClass:_classTextField.text addSex:_label.text addScore:_scoreTextField.text]) {

            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加成功" message:@"请在学生信息显示处查看" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                //响应事件
                self.scoreTextField.text = @"";
                self.label.text = @"";
                self.classTextField.text = @"";
                self.numTextField.text = @"";
                self.nameTextField.text = @"";
            }];
            
            [alert addAction:firstAction];
            
            alert.view.tintColor = [UIColor blackColor];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        } else {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"输入的信息不合法哟" message:@"请根据提示重新输入" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *firstAction1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                //响应事件
                self.scoreTextField.text = @"";
                self.label.text = @"";
                self.classTextField.text = @"";
                self.numTextField.text = @"";
                self.nameTextField.text = @"";
            }];
            
            [alert1 addAction:firstAction1];
            
            alert1.view.tintColor = [UIColor blackColor];
            [self presentViewController:alert1 animated:YES completion:nil];
        }
//        button.selected = NO;
    }
        
        
    
}

- (void)alert:(NSNotification *)text {
//        NSLog(@"%@",text.userInfo[@"alert"]);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:text.userInfo[@"alert"] message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.scoreTextField.text = @"";
        self.label.text = @"";
        self.classTextField.text = @"";
        self.numTextField.text = @"";
        self.nameTextField.text = @"";
    }];
    [alert addAction:firstAction];
    
    alert.view.tintColor = [UIColor blackColor];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)viewDidDisappear:(BOOL)animated {
    _scoreTextField.text = @"";
    _label.text = @"";
    _classTextField.text = @"";
    _numTextField.text = @"";
    _nameTextField.text = @"";
}
- (void)pressLeftButton {
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
