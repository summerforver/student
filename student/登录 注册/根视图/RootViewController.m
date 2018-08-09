
//
//  RootViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/9.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIViewController *viewController = [[UIViewController alloc] init];
    UIImageView *iView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 670)];
    
    [viewController.view addSubview:iView];
    iView.image = [UIImage imageNamed:@"31.JPG"];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 120, 300, 50)];
    label.text = @"欢迎光临不知道是谁的学生管理系统";
    label.font = [UIFont systemFontOfSize:18.0];
    label.textColor = [UIColor whiteColor];
    
    
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 280, 50)];
    label1.text = @"开启你的奇妙之旅";
    label1.font = [UIFont systemFontOfSize:24.0];
    label1.textColor = [UIColor whiteColor];
    
   
    [self.view addSubview:iView];
    [self.view addSubview:label];
    [self.view addSubview:label1];
    
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
