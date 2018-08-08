//
//  ShowViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ShowViewController.h"
#import "StudentTableViewCell.h"
#import "StudentMessage.h"

//int count = 5;
@interface ShowViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title= @"显示学生信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.92f green:0.31f blue:0.46f alpha:1.00f], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.86f green:0.82f blue:0.82f alpha:1.00f];
    self.navigationController.navigationBar.hidden = NO;
    
//    _nameMutableArray = [NSMutableArray arrayWithObjects:@"小华",@"小白",@"小花",@"小明",@"小红", nil];
//    _numberMutableArray = [NSMutableArray arrayWithObjects:@"04173118",@"04173119",@"04173123",@"04173213",@"04173141", nil];
//
//    _classMutableArray = [NSMutableArray arrayWithObjects:@"软件1703",@"网络1702",@"计科1706",@"软件1704",@"计科1701", nil];
//    _sexMutableArray = [NSMutableArray arrayWithObjects:@"男",@"男",@"女",@"男",@"女", nil];
//    _scoreMutableArray = [NSMutableArray arrayWithObjects:@"86.5",@"90.0",@"65.0",@"78.5",@"80.0", nil];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 70, 365, [UIScreen mainScreen].bounds.size.height - 64)];
    UIImageView *pictureImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    pictureImageView.image = [UIImage imageNamed:@"10.JPG"];
    _tableView.backgroundView = pictureImageView;
    [self.tableView registerClass:[StudentTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    StudentMessage *firstStudent = [[StudentMessage alloc] initWithName:@"库里" addNumber:@"04173118" addClass:@"软件1704" addSex:@"男" addScore:@"100.0"];
    StudentMessage *secondStudent = [[StudentMessage alloc] initWithName:@"小花" addNumber:@"04173213" addClass:@"网络1701" addSex:@"女" addScore:@"79.5"];
     StudentMessage *thirdStudent = [[StudentMessage alloc] initWithName:@"小铭" addNumber:@"04173014" addClass:@"计科1701" addSex:@"男" addScore:@"65.0"];
    _studentMutableArray =[[NSMutableArray alloc] init];
    [_studentMutableArray addObject:firstStudent];
    [_studentMutableArray addObject:secondStudent];
    [_studentMutableArray addObject:thirdStudent];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(add:) name:@"add" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(delete:) name:@"delete" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteReally:) name:@"deleteReally" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change:) name:@"change" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeReally:) name:@"changeReally" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(check:) name:@"check" object:nil];
}

- (void)add:(NSNotification *)text {
//    NSLog(@"%@",text.userInfo[@"nameText"]);
    StudentMessage *studentFirst = [[StudentMessage alloc] init];
    studentFirst.nameString = text.userInfo[@"nameText"];
    studentFirst.numberString = text.userInfo[@"numText"];
    studentFirst.classString = text.userInfo[@"classText"];
    studentFirst.sexString = text.userInfo[@"sexText"];
    studentFirst.scoreString = text.userInfo[@"scoreText"];

    [_studentMutableArray addObject:studentFirst];
    
    [_tableView reloadData];

}

- (void)deleteReally:(NSNotification *)text {
    //    NSLog(@"%@",text.userInfo[@"nameText"]);
    StudentMessage *studentSecond = [[StudentMessage alloc] init];
    studentSecond = text.userInfo[@"deleteReally"];
    //    [_nameMutableArray addObject:text.userInfo[@"nameText"]];
    //    [_numberMutableArray addObject:text.userInfo[@"numText"]];
    //    [_classMutableArray addObject:text.userInfo[@"classText"]];
    //    [_sexMutableArray addObject:text.userInfo[@"sexText"]];
    //    [_scoreMutableArray addObject:text.userInfo[@"scoreText"]];
    
    [_studentMutableArray removeObject:studentSecond];
    
    [_tableView reloadData];
    
}

- (void)changeReally:(NSNotification *)text {
    //    NSLog(@"%@",text.userInfo[@"nameText"]);
    int i;
    StudentMessage *studentThird = [[StudentMessage alloc] init];
    studentThird.nameString = text.userInfo[@"nameChText"];
    studentThird.numberString = text.userInfo[@"numberChText"];
    studentThird.classString = text.userInfo[@"classChText"];
    studentThird.sexString = text.userInfo[@"sexChText"];
    studentThird.scoreString = text.userInfo[@"scoreChText"];
    
    NSLog(@"%@",studentThird.nameString);
    
    for (i = 0 ; i < _studentMutableArray.count; i ++) {
        StudentMessage *c = [[StudentMessage alloc] init];
        c = _studentMutableArray[i];
        
        if ( [studentThird.numberString isEqualToString:c.numberString]) {
            break;
        }
    }
    [_studentMutableArray replaceObjectAtIndex:i withObject:studentThird];
    
    [_tableView reloadData];
    
}


- (void)delete:(NSNotification *)text {
    int count = 0;
//    NSLog(@"%ld",_studentMutableArray.count);
    for (int i = 0 ; i < _studentMutableArray.count; i ++) {
        StudentMessage *c = [[StudentMessage alloc] init];
        c = _studentMutableArray[i];
        if ([c.numberString isEqualToString:text.userInfo[@"deleteText"]]) {
            count ++;
            StudentMessage *bStudent = [[StudentMessage alloc] init];
            bStudent = c;
            NSDictionary *dict =@{@"studentDeleteMessage":bStudent};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"delete1" object:nil userInfo:dict];
            break;
        }
    }
    if (count == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有找到该学号" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        
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

- (void)change:(NSNotification *)text {
    int count2 = 0;
    //    NSLog(@"%ld",_studentMutableArray.count);
    for (int i = 0 ; i < _studentMutableArray.count; i ++) {
        StudentMessage *d = [[StudentMessage alloc] init];
        d = _studentMutableArray[i];
        if ([d.numberString isEqualToString:text.userInfo[@"changeText"]]) {
            count2 ++;
            
            StudentMessage *bStudent = [[StudentMessage alloc] init];
            bStudent = d;
            NSDictionary *dict =@{@"studentChangeMessage":bStudent};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"change1" object:nil userInfo:dict];
            break;
        }
    }
    if (count2 == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有找到该学号" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        
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


- (void)check:(NSNotification *)text {
//    NSLog(@"%@",text.userInfo[@"checkText"]);
//    NSLog(@"%@",_student.numberString);
//    StudentMessage *b = _studentMutableArray
    int count1 = 0;
    for (int i = 0 ; i < _studentMutableArray.count; i ++) {
        StudentMessage *b = [[StudentMessage alloc] init];
        b = _studentMutableArray[i];
        if ([b.numberString isEqualToString:text.userInfo[@"checkText"]]) {
            count1 ++;
            StudentMessage *aStudent = [[StudentMessage alloc] init];
            aStudent = b;
            NSDictionary *dict =@{@"studentMessage":aStudent};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"check1" object:nil userInfo:dict];
            break;
        }
    }
    if (count1 == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"没有找到该学号" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        
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

- (void)dealloc {

//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"add" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"add" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"delete" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"deleteReally" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"check" object:nil];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _studentMutableArray.count;
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"%ld",indexPath.section);
    
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    StudentMessage *student = _studentMutableArray[indexPath.section];
    cell.nameMessageLabel.text = student.nameString;
    cell.numberMessageLabel.text = student.numberString;
    cell.classMessageLabel.text = student.classString;
    cell.sexMessageLabel.text = student.sexString;
    cell.scoreMessageLabel.text = student.scoreString;
    
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
