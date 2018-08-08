//
//  DeleteViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "DeleteViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"18.JPG"];
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
    _deleteTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_deleteTextField];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(310, 120, 50, 40)];
    [deleteButton setTitle:@"搜索" forState:UIControlStateNormal];
    [deleteButton setBackgroundColor:[UIColor orangeColor]];
    deleteButton.layer.masksToBounds = YES;
    deleteButton.layer.cornerRadius = 7;
    [deleteButton addTarget:self action:@selector(pressDeleteButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:deleteButton];
    
}

- (void)pressDeleteButton:(UIButton *)button {
    button.selected = !button.selected;
    
//    NSDictionary *dict = @{@"deleteText":self.deleteTextField.text};
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"delete" object:nil userInfo:dict];
    if (button.selected == YES) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认删除" message:@"请在学生信息显示处查看" preferredStyle:UIAlertControllerStyleAlert];

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

    }
    
    
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
