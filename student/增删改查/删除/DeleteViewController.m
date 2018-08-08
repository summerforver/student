//
//  DeleteViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "DeleteViewController.h"
#import "StudentTableViewCell.h"
#import "StudentMessage.h"

@interface DeleteViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"26.JPG"];
    [self.view addSubview:backgroundView];
    
    self.navigationItem.title= @"删除学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
    
    [self creatView];
}

- (void)creatView {
    
    UILabel *deleteLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 270, 40)];
    deleteLabel.text = @"请输入你要删除的学生学号:";
    deleteLabel.font = [UIFont systemFontOfSize:18.0];
    deleteLabel.textColor = [UIColor colorWithRed:0.85f green:0.71f blue:0.00f alpha:1.00f];
    deleteLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:deleteLabel];
    
    _deleteTextField = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, 270, 40)];
    _deleteTextField.layer.masksToBounds = YES;
    _deleteTextField.layer.cornerRadius = 7;
    _deleteTextField.placeholder = @"请输入八位学号";
    _deleteTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_deleteTextField];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(310, 120, 50, 40)];
    [deleteButton setTitle:@"搜索" forState:UIControlStateNormal];
    [deleteButton setBackgroundColor:[UIColor orangeColor]];
    deleteButton.layer.masksToBounds = YES;
    deleteButton.layer.cornerRadius = 7;
    [deleteButton addTarget:self action:@selector(pressDeleteButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:deleteButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 180, 365, 0) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[StudentTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.scrollEnabled = NO;
    //    [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    [self.view addSubview:_tableView];
    
    _deleteReallyButton= [[UIButton alloc] initWithFrame:CGRectMake(140, 300, 100, 0)];
    [_deleteReallyButton setTitle:@"确定删除" forState:UIControlStateNormal];
    [_deleteReallyButton setBackgroundColor:[UIColor orangeColor]];
    _deleteReallyButton.layer.masksToBounds = YES;
    _deleteReallyButton.layer.cornerRadius = 7;
    [_deleteReallyButton addTarget:self action:@selector(pressDeleteReallyButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_deleteReallyButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(delete1:) name:@"delete1" object:nil];
    
}

- (void)pressDeleteButton:(UIButton *)button {
    button.selected = !button.selected;
    
//    NSDictionary *dict = @{@"deleteText":self.deleteTextField.text};
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"delete" object:nil userInfo:dict];
    if (button.selected == YES) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认搜索" message:@"" preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
//            NSLog(@"action = %@", action);
            NSDictionary *dict = @{@"deleteText":self.deleteTextField.text};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"delete" object:nil userInfo:dict];
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

- (void)delete1:(NSNotification *)text {
    //    NSLog(@"%@",text.userInfo[@"nameText"]);
    _a = [[StudentMessage alloc] init];
    _a = text.userInfo[@"studentDeleteMessage"];
    
    if ([_a.numberString isEqualToString:self.deleteTextField.text]) {
        self.tableView.frame = CGRectMake(5, 180, 365, 100);
        self.deleteReallyButton.frame = CGRectMake(140, 300, 100, 40);
    } else {
        self.tableView.frame = CGRectMake(5, 180, 365, 0);
        self.deleteReallyButton.frame = CGRectMake(140, 300, 100, 0);
    }
    
    //    _a.nameString = text.userInfo[@"nameText"];
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
    cell.nameMessageLabel.text = _a.nameString;
    cell.numberMessageLabel.text = _a.numberString;
    cell.classMessageLabel.text = _a.classString;
    cell.sexMessageLabel.text = _a.sexString;
    cell.scoreMessageLabel.text = _a.scoreString;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)pressDeleteReallyButton:(UIButton *)button {
    button.selected = !button.selected;
    
    //    NSDictionary *dict = @{@"deleteText":self.deleteTextField.text};
    //
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"delete" object:nil userInfo:dict];
    if (button.selected == YES) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认删除" message:@"请确定是否删除" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            //            NSLog(@"action = %@", action);
            NSDictionary *dict = @{@"deleteReally":self.a};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteReally" object:nil userInfo:dict];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除成功" message:@"请在显示页面查看" preferredStyle:UIAlertControllerStyleAlert];
            
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
        
    }
    
    
    
}


- (void)viewDidDisappear:(BOOL)animated {
    _deleteTextField.text = @"";
    self.tableView.frame = CGRectMake(5, 180, 365, 0);
    self.deleteReallyButton.frame = CGRectMake(140, 300, 100, 0);
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
