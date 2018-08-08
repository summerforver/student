//
//  CheckViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "CheckViewController.h"
#import "StudentTableViewCell.h"

@interface CheckViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation CheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"20.JPG"];
    [self.view addSubview:backgroundView];
    
    self.navigationItem.title= @"查询学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
    [self creatView];
    
   
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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 140, 365, 100) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [self.view addSubview:_tableView];
    
}

- (void)pressCheckButton:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认查询" message:@" " preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
//            NSLog(@"action = %@", action);
            
            
            
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
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
//    return 5;
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
    
    
//    StudentMessage *student = _studentMutableArray[indexPath.section];
//    cell.nameMessageLabel.text = student.nameString;
//    cell.numberMessageLabel.text = student.nurString;
//    cell.classMessageLabel.text = student.classString;
//    cell.sexMessageLabel.text = student.sexString;
//    cell.scoreMessageLabel.text = student.scoreString;
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
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
