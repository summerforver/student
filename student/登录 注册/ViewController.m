//
//  ViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "MainInterfaceViewController.h"
#import "ShowViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "CheckViewController.h"


@interface ViewController ()<ChangeValueDelegte>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.view.backgroundColor = [UIColor colorWithRed:0.69f green:0.80f blue:0.93f alpha:1.00f];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"12.JPG"];
    [self.view addSubview:backgroundView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 70, 40)];
    nameLabel.text = @"用户名:";
    nameLabel.font = [UIFont systemFontOfSize:16.0];
    
     _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 100, 200, 40)];
    [self setNameTextField:_nameTextField];
   
    UILabel *passLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 180, 70, 40)];
    passLabel.text = @"密码:";
    passLabel.font = [UIFont systemFontOfSize:16.0];
    _passTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 180, 200, 40)];
    _passTextField.secureTextEntry = YES;
    [self setNameTextField:_passTextField];
    
    
    _submitButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 280, 70, 30)];
    [_submitButton setTitle:@"登录" forState:UIControlStateNormal];
    [_submitButton addTarget:self action:@selector(pressSubmitButton) forControlEvents:UIControlEventTouchDown];
    [self setLoginButton:_submitButton];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 280, 70, 30)];
    [_loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(pressLoginButton) forControlEvents:UIControlEventTouchDown];
    [self setLoginButton:_loginButton];
   
    [self.view addSubview:nameLabel];
    [self.view addSubview:passLabel];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_passTextField];
    [self.view addSubview:_submitButton];
    [self.view addSubview:_loginButton];
    
    
}

- (void)setNameTextField:(UITextField *)nameTextField {
    nameTextField.backgroundColor = [UIColor whiteColor];
    nameTextField.layer.masksToBounds = YES;
    nameTextField.layer.cornerRadius = 7;
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
}

- (void)setLoginButton:(UIButton *)loginButton {
//    loginButton.titleLabel.font = [UIFont systemFontOfSize:21.0];
    loginButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.59f blue:0.45f alpha:1.00f];
//    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.cornerRadius = 7;
    
}

- (void)pressSubmitButton {
//    MainInterfaceViewController *mainViewController = [[MainInterfaceViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainViewController];
//    self.view.window.rootViewController = nav;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ShowViewController *show = [[ShowViewController alloc] init];
    show.title = @"显示";
    AddViewController *add = [[AddViewController alloc] init];
    add.title = @"增加";
    DeleteViewController *delete = [[DeleteViewController alloc] init];
    delete.title = @"删除";
    ChangeViewController *change = [[ChangeViewController alloc] init];
    change.title = @"修改";
    CheckViewController *check = [[CheckViewController alloc] init];
    check.title = @"查询";
    
    UINavigationController *showNavigationController = [[UINavigationController alloc] initWithRootViewController:show];
    UINavigationController *addNavigationController = [[UINavigationController alloc] initWithRootViewController:add];
    UINavigationController *deleteNavigationController = [[UINavigationController alloc] initWithRootViewController:delete];
    UINavigationController *changeNavigationController = [[UINavigationController alloc] initWithRootViewController:change];
    UINavigationController *checkNavigationController = [[UINavigationController alloc] initWithRootViewController:check];
    
    tabBarController.viewControllers = @[showNavigationController, addNavigationController, deleteNavigationController, changeNavigationController, checkNavigationController];
    
    self.view.window.rootViewController = tabBarController;
    
}

- (void)pressLoginButton {
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    
    loginViewController.delegate = self;
    
    [self presentViewController:loginViewController animated:YES completion:nil];
}

- (void)shouldChangeValue:(NSString *)paraStr :(NSString *)nameStr {
    _nameTextField.text = paraStr;
    _passTextField.text = nameStr;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
