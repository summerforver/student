//
//  MainInterfaceViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MainInterfaceViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "CheckViewController.h"
#import "ViewController.h"
#import "ShowViewController.h"

@interface MainInterfaceViewController ()

@end

@implementation MainInterfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:0.69f green:0.80f blue:0.93f alpha:1.00f];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"21.JPG"];
    [self.view addSubview:backgroundView];
    
    UIButton *showButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 50, 140, 40)];
    [showButton setTitle:@"显示学生信息" forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(pressShowButton) forControlEvents:UIControlEventTouchDown];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 100, 140, 40)];
    [addButton setTitle:@"增加学生信息" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(pressAddButton) forControlEvents:UIControlEventTouchDown];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 150, 140, 40)];
    [deleteButton setTitle:@"删除学生信息" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchDown];
    
    UIButton *changeButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 200, 140, 40)];
    [changeButton setTitle:@"修改学生信息" forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(pressChangeButton) forControlEvents:UIControlEventTouchDown];
    
    UIButton *checkButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 250, 140, 40)];
    [checkButton setTitle:@"查询学生信息" forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(pressCheckButton) forControlEvents:UIControlEventTouchDown];
    
//    UIButton *returnButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 300, 60, 30)];
//    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
//    [returnButton addTarget:self action:@selector(pressReturnButton) forControlEvents:UIControlEventTouchDown];
    self.navigationController.navigationBar.hidden = YES;
    
    [self setButton:showButton];
    [self setButton:addButton];
    [self setButton:deleteButton];
    [self setButton:changeButton];
    [self setButton:checkButton];
//    [self setButton:returnButton];
    
    [self.view addSubview:showButton];
    [self.view addSubview:addButton];
    [self.view addSubview:deleteButton];
    [self.view addSubview:changeButton];
    [self.view addSubview:checkButton];
//    [self.view addSubview:returnButton];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
}

- (void)tongzhi:(NSNotification *)text {
    NSLog(@"%@",text.userInfo[@"nameText"]);
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)setButton:(UIButton *)button {
//    button.titleLabel.font = [UIFont systemFontOfSize:21.0];
    button.backgroundColor = [UIColor colorWithRed:1.00f green:0.59f blue:0.45f alpha:1.00f];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 7;
}

//- (void)pressReturnButton {
//    [self dismissViewControllerAnimated:YES completion:nil];
////    ViewController *viewController = [[ViewController alloc] init];
////    [self.navigationController popToViewController:viewController animated:YES];
//}

- (void)pressShowButton {
    ShowViewController *showViewController = [[ShowViewController alloc] init];
    [self.navigationController pushViewController:showViewController animated:YES];
    //    [self presentViewController:addViewController animated:YES completion:nil];
}

- (void)pressAddButton {
    AddViewController *addViewController = [[AddViewController alloc] init];
    [self.navigationController pushViewController:addViewController animated:YES];
//    [self presentViewController:addViewController animated:YES completion:nil];
}

- (void)pressDeleteButton {
    DeleteViewController *deleteViewController = [[DeleteViewController alloc] init];
    [self.navigationController pushViewController:deleteViewController animated:YES];
    //    [self presentViewController:addViewController animated:YES completion:nil];
}

- (void)pressChangeButton {
    ChangeViewController *changeViewController = [[ChangeViewController alloc] init];
    [self.navigationController pushViewController:changeViewController animated:YES];
    //    [self presentViewController:addViewController animated:YES completion:nil];
}

- (void)pressCheckButton {
    CheckViewController *checkViewController = [[CheckViewController alloc] init];
    [self.navigationController pushViewController:checkViewController animated:YES];
    //    [self presentViewController:addViewController animated:YES completion:nil];
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
