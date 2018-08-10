//
//  CheckViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "CheckViewController.h"
#import "StudentTableViewCell.h"
#import "StudentMessage.h"

@interface CheckViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation CheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"27.JPG"];
    [self.view addSubview:backgroundView];
    
    self.navigationItem.title= @"查询学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
    [self creatView];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(check1:) name:@"check1" object:nil];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alert:) name:@"alert" object:nil];
}

- (void)creatView {
    
    UILabel *checkLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 270, 40)];
    checkLabel.text = @"请输入你要查询的学生学号:";
    checkLabel.font = [UIFont systemFontOfSize:18.0];
    checkLabel.textColor = [UIColor colorWithRed:0.85f green:0.71f blue:0.00f alpha:1.00f];
    checkLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:checkLabel];
    
    _checkTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, 270, 40)];
    _checkTextField.layer.masksToBounds = YES;
    _checkTextField.placeholder = @"请输入八位学号";
    _checkTextField.layer.cornerRadius = 7;
    _checkTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_checkTextField];
    
    UIButton *checkButton = [[UIButton alloc] initWithFrame:CGRectMake(310, 120, 50, 40)];
    [checkButton setTitle:@"查询" forState:UIControlStateNormal];
    [checkButton setBackgroundColor:[UIColor orangeColor]];
    checkButton.layer.masksToBounds = YES;
    checkButton.layer.cornerRadius = 7;
    [checkButton addTarget:self action:@selector(pressCheckButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:checkButton];
    
//    [self tableView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 180, 365, 100) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[StudentTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.scrollEnabled = NO;
    //[_tableView reloadData];
    //    [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [self.view addSubview:_tableView];

    
}

//- (UITableView *)tableView {
//    if (_tableView == nil) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 180, 365, 100) style:UITableViewStyleGrouped];
//        [self.tableView registerClass:[StudentTableViewCell class] forCellReuseIdentifier:@"cell"];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.backgroundColor = [UIColor clearColor];
//        _tableView.scrollEnabled = NO;
//        [_tableView reloadData];
//        //    [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
//        [self.view addSubview:_tableView];
//    }
//
//    return _tableView;
//}

- (void)pressCheckButton:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        
        NSLog(@"%@111",self.checkTextField.text);
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认查询" message:@" " preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
//            NSLog(@"action = %@", action);
            NSDictionary *dict = @{@"checkText":self.checkTextField.text};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"check" object:nil userInfo:dict];
            
            
//            self.tableView.frame = CGRectMake(5, 180, 365, 100);
            
        }];
        
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//            self.tableView.frame = CGRectMake(5, 180, 365, 0);
//            NSLog(@"action = %@", action);
        }];
        
        [alert addAction:firstAction];
        [alert addAction:secondAction];
        
        alert.view.tintColor = [UIColor blackColor];
        [self presentViewController:alert animated:YES completion:nil];
        
        button.selected = NO;
    }
    
}

- (void)dealloc {
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"check" object:nil];
    
    
}

//- (void)check1:(NSNotification *)text {
////    NSLog(@"%@",text.userInfo[@"nameText"]);
//    _a = [[StudentMessage alloc] init];
//    _a = text.userInfo[@"studentMessage"];
//
//     NSLog(@"%@222",_a.numberString);
//    NSLog(@"%@",_a.nameString);
//
//    if ([_a.numberString isEqualToString:self.checkTextField.text]) {
//        NSLog(@"hahhahahahahaha");
//        _flagRight = 1;
//        [_tableView reloadData];
//    } else {
//        _flagRight = 0;
//        [_tableView reloadData];
//    }
////    [_tableView reloadData];
//
////    _flagRight = 1;
////    [_tableView reloadData];
//
////    self.tableView.frame = CGRectMake(5, 180, 365, 100);
////    if ([_a.numberString isEqualToString:self.checkTextField.text]) {
////        self.tableView.frame = CGRectMake(5, 180, 365, 100);
////    } else {
////        self.tableView.frame = CGRectMake(5, 180, 365, 0);
////    }
////
////    _a.nameString = text.userInfo[@"nameText"];
//}

- (void)alert:(NSNotification *)text {

//    _flagRight = 0;
//    [_tableView reloadData];
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有找到该学号" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//        //响应事件
//        NSLog(@"action = %@", action);
//        self.checkTextField.text = @"";
//
//    }];
//    [alert addAction:firstAction];
//
//    alert.view.tintColor = [UIColor blackColor];
//    [self presentViewController:alert animated:YES completion:nil];

        _checkMutableArray = text.userInfo[@"alert"];
//        NSLog(@"%ld",_checkMutableArray.count);
//        NSLog(@"%@",_checkTextField.text);
        StudentMessage *goodStudent = [[StudentMessage alloc] init];
        int flag = 1;
        int i;
        for (i = 0; i < _checkMutableArray.count; i ++) {
            NSLog(@"12");
            goodStudent = _checkMutableArray[i];
            if ([_checkTextField.text isEqualToString:goodStudent.numberString]) {
                flag = 0;
                break;
            }
        }
        if (flag == 0) {
            NSLog(@"aaaaaaaaaaaa");
            StudentMessage *aStudent = [[StudentMessage alloc] init];
            aStudent = _checkMutableArray[i];
            _a = aStudent;
            _flagRight = 1;
            NSLog(@"_tableView = %@",_tableView);
            [_tableView reloadData];
            
//            self.tableView.frame = CGRectMake(5, 180, 365, 100);
    
        } else {
            NSLog(@"13");
            _flagRight = 0;
            [_tableView reloadData];
    //        self.tableView.frame = CGRectMake(5, 180, 365, 0);
//            self.tableView.frame = CGRectMake(5, 180, 365, 0);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"学号不存在" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
    
            UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                //响应事件
                NSLog(@"action = %@", action);
    
            }];
    
            [alert addAction:firstAction];
            alert.view.tintColor = [UIColor blackColor];
            [self presentViewController:alert animated:YES completion:nil];
        }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
    if (_flagRight == 1) {
        return 1;
    } else {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.00001;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    NSLog(@"%ld",indexPath.section);
    
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
        NSLog(@"%@-----------------------",_a.numberString);
        cell.nameMessageLabel.text = _a.nameString;
        cell.numberMessageLabel.text = _a.numberString;
        cell.classMessageLabel.text = _a.classString;
        cell.sexMessageLabel.text = _a.sexString;
        cell.scoreMessageLabel.text = _a.scoreString;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    
}



- (void)viewDidDisappear:(BOOL)animated {
    _checkTextField.text = @"";
//    self.tableView.frame = CGRectMake(5, 180, 365, 0);
    _flagRight = 0;
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
