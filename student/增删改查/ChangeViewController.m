//
//  ChangeViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ChangeViewController.h"
#import "ChangeTableViewCell.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"11.JPG"];
    [self.view addSubview:backgroundView];
    
    self.navigationItem.title= @"修改学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
    UILabel *changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 270, 40)];
    changeLabel.text = @"请输入你要修改的学生学号:";
    changeLabel.font = [UIFont systemFontOfSize:18.0];
    changeLabel.textColor = [UIColor colorWithRed:0.85f green:0.71f blue:0.00f alpha:1.00f];
    changeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:changeLabel];
    
    _changeTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 120, 270, 40)];
    _changeTextField.layer.masksToBounds = YES;
    _changeTextField.layer.cornerRadius = 7;
    _changeTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_changeTextField];
    
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 250, 360, 100)];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.scrollEnabled = NO;
    
    
    [self.tableView registerClass:[ChangeTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];

    
//    [self creatView];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//- (void)creatView {
//
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 270, 40)];
//    label.text = @"请输入你要修改的学生信息:";
//    label.font = [UIFont systemFontOfSize:18.0];
//    label.textColor = [UIColor colorWithRed:0.85f green:0.71f blue:0.00f alpha:1.00f];
//    label.textAlignment = NSTextAlignmentCenter;
//
//
//    UILabel *nameLabel = [[UILabel alloc] init];
//    nameLabel.frame = CGRectMake(30, 120, 60, 40);
//    nameLabel.text = @"姓名:";
//    nameLabel.textColor = [UIColor purpleColor];
//    nameLabel.font = [UIFont systemFontOfSize:18.0];
//    nameLabel.textAlignment = NSTextAlignmentCenter;
//
//    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 120, 200, 40)];
//    _nameTextField.layer.masksToBounds = YES;
//    _nameTextField.layer.cornerRadius = 7;
//    _nameTextField.backgroundColor = [UIColor whiteColor];
//
//    UILabel *numberLabel = [[UILabel alloc] init];
//    numberLabel.frame = CGRectMake(30, 170, 60, 40);
//    numberLabel.text = @"学号:";
//    numberLabel.textColor = [UIColor purpleColor];
//    numberLabel.font = [UIFont systemFontOfSize:18.0];
//    numberLabel.textAlignment = NSTextAlignmentCenter;
//
//    _numTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 170, 200, 40)];
//    _numTextField.layer.masksToBounds = YES;
//    _numTextField.layer.cornerRadius = 7;
//    _numTextField.backgroundColor = [UIColor whiteColor];
//
//    UILabel *classLabel = [[UILabel alloc] init];
//    classLabel.frame = CGRectMake(30, 220, 60, 40);
//    classLabel.text = @"班级:";
//    classLabel.textColor = [UIColor purpleColor];
//    classLabel.font = [UIFont systemFontOfSize:18.0];
//    classLabel.textAlignment = NSTextAlignmentCenter;
//
//    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 220, 200, 40)];
//    _classTextField.layer.masksToBounds = YES;
//    _classTextField.layer.cornerRadius = 7;
//    _classTextField.backgroundColor = [UIColor whiteColor];
//
//    UILabel *sexLabel = [[UILabel alloc] init];
//    sexLabel.frame = CGRectMake(30, 270, 60, 40);
//    sexLabel.text = @"性别:";
//    sexLabel.textColor = [UIColor purpleColor];
//    sexLabel.font = [UIFont systemFontOfSize:18.0];
//    sexLabel.textAlignment = NSTextAlignmentCenter;
//
//    _sexTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 270, 200, 40)];
//    _sexTextField.layer.masksToBounds = YES;
//    _sexTextField.layer.cornerRadius = 7;
//    _sexTextField.backgroundColor = [UIColor whiteColor];
//
//    UILabel *scoreLabel = [[UILabel alloc] init];
//    scoreLabel.frame = CGRectMake(30, 320, 60, 40);
//    scoreLabel.text = @"成绩:";
//    scoreLabel.textColor = [UIColor purpleColor];
//    scoreLabel.font = [UIFont systemFontOfSize:18.0];
//    scoreLabel.textAlignment = NSTextAlignmentCenter;
//
//    _scoreTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 320, 200, 40)];
//    _scoreTextField.layer.masksToBounds = YES;
//    _scoreTextField.layer.cornerRadius = 7;
//    _scoreTextField.backgroundColor = [UIColor whiteColor];
//
//    [self.view addSubview:label];
//    [self.view addSubview:nameLabel];
//    [self.view addSubview:_nameTextField];
//    [self.view addSubview:numberLabel];
//    [self.view addSubview:_numTextField];
//    [self.view addSubview:classLabel];
//    [self.view addSubview:_classTextField];
//    [self.view addSubview:sexLabel];
//    [self.view addSubview:_sexTextField];
//    [self.view addSubview:scoreLabel];
//    [self.view addSubview:_scoreTextField];
//
//}

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
