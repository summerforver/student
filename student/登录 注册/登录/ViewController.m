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
    backgroundView.image = [UIImage imageNamed:@"22.JPG"];
    [self.view addSubview:backgroundView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, 70, 40)];
    nameLabel.text = @"用户名:";
    nameLabel.font = [UIFont systemFontOfSize:16.0];
    
     _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 80, 200, 40)];
    [self setNameTextField:_nameTextField];
   
    UILabel *passLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 160, 70, 40)];
    passLabel.text = @"密码:";
    passLabel.font = [UIFont systemFontOfSize:16.0];
    _passTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 160, 200, 40)];
    _passTextField.secureTextEntry = YES;
    [self setNameTextField:_passTextField];
    
    
    _submitButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 70, 30)];
    [_submitButton setTitle:@"登录" forState:UIControlStateNormal];
    [_submitButton addTarget:self action:@selector(pressSubmitButton) forControlEvents:UIControlEventTouchDown];
    [self setLoginButton:_submitButton];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 300, 70, 30)];
    [_loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(pressLoginButton) forControlEvents:UIControlEventTouchDown];
    [self setLoginButton:_loginButton];
   
    [self.view addSubview:nameLabel];
    [self.view addSubview:passLabel];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_passTextField];
    [self.view addSubview:_submitButton];
    [self.view addSubview:_loginButton];
    
    _personMutableArray = [NSMutableArray arrayWithObjects:@"04173118", @"12345678", @"11111111", nil];
    _passMutableArray = [NSMutableArray arrayWithObjects:@"123456", @"123456", @"123456", nil];
    
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
    
    int i;
    int count = 0;
    for (i = 0; i < _personMutableArray.count; i ++) {
        if ([self.nameTextField.text isEqualToString:_personMutableArray[i]]) {
            NSLog(@"%@", self.nameTextField.text);
            count ++;
            break;
        }
    }
    
    if (count == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户名不存在" message:@"请注册一个用户" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            NSLog(@"action = %@", action);
            self.nameTextField.text = @"";
            self.passTextField.text = @"";
            
        }];
        
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSLog(@"action = %@", action);
        }];
        
        [alert addAction:firstAction];
        [alert addAction:secondAction];
        
        alert.view.tintColor = [UIColor blackColor];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        if ([self.passTextField.text isEqualToString:_passMutableArray[i]]) {
            UITabBarController *tabBarController = [[UITabBarController alloc] init];
            
            ShowViewController *show = [[ShowViewController alloc] init];
            show.title = @"显示";
            show.tabBarItem.image = [[UIImage imageNamed:@"显示"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
            
            AddViewController *add = [[AddViewController alloc] init];
            add.title = @"增加";
            add.tabBarItem.image = [[UIImage imageNamed:@"增加"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            DeleteViewController *delete = [[DeleteViewController alloc] init];
            delete.title = @"删除";
            delete.tabBarItem.image = [[UIImage imageNamed:@"删除"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            ChangeViewController *change = [[ChangeViewController alloc] init];
            change.title = @"修改";
            change.tabBarItem.image = [[UIImage imageNamed:@"修改"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            CheckViewController *check = [[CheckViewController alloc] init];
            check.title = @"查询";
            check.tabBarItem.image = [[UIImage imageNamed:@"查询"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UINavigationController *showNavigationController = [[UINavigationController alloc] initWithRootViewController:show];
            UINavigationController *addNavigationController = [[UINavigationController alloc] initWithRootViewController:add];
            UINavigationController *deleteNavigationController = [[UINavigationController alloc] initWithRootViewController:delete];
            UINavigationController *changeNavigationController = [[UINavigationController alloc] initWithRootViewController:change];
            UINavigationController *checkNavigationController = [[UINavigationController alloc] initWithRootViewController:check];
            
            tabBarController.viewControllers = @[showNavigationController, addNavigationController, deleteNavigationController, changeNavigationController, checkNavigationController];
            
            self.view.window.rootViewController = tabBarController;
            
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码错误" message:@"请重新输入密码" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                //响应事件
                NSLog(@"action = %@", action);
                self.passTextField.text = @"";
                
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
    
    
    
}

- (void)pressLoginButton {
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    
    loginViewController.delegate = self;
    
    [self presentViewController:loginViewController animated:YES completion:nil];
}

- (void)shouldChangeValue:(NSString *)nameString :(NSString *)passString {
    
    [_personMutableArray addObject:nameString];
    [_passMutableArray addObject:passString];
    
    _nameTextField.text = nameString;
//    _passTextField.text = passString;

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
