//
//  LoginViewController.m
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "LoginViewController.h"



@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:0.69f green:0.80f blue:0.93f alpha:1.00f];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.image = [UIImage imageNamed:@"25.JPG"];
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
    
    UILabel *reallPassLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 260, 70, 40)];
    reallPassLabel.text = @"确认密码:";
    reallPassLabel.font = [UIFont systemFontOfSize:14.0];
    
    _reallyPassTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 260, 200, 40)];
    _reallyPassTextField.secureTextEntry = YES;
    [self setNameTextField:_reallyPassTextField];
    
    
    _reallyLoginButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 330, 100, 30)];
    [_reallyLoginButton setTitle:@"确认注册" forState:UIControlStateNormal];
    [_reallyLoginButton addTarget:self action:@selector(pressReallyLoginButton) forControlEvents:UIControlEventTouchDown];
    [self setLoginButton:_reallyLoginButton];
    
    [self.view addSubview:nameLabel];
    [self.view addSubview:passLabel];
    [self.view addSubview:reallPassLabel];
    [self.view addSubview:_nameTextField];
    [self.view addSubview:_passTextField];
    [self.view addSubview:_reallyPassTextField];
    [self.view addSubview:_reallyLoginButton];
    
    
}

- (void)setNameTextField:(UITextField *)nameTextField {
    nameTextField.backgroundColor = [UIColor whiteColor];
    nameTextField.layer.masksToBounds = YES;
    nameTextField.layer.cornerRadius = 7;
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
}

- (void)setLoginButton:(UIButton *)loginButton {
//    loginButton.titleLabel.font = [UIFont systemFontOfSize:21.0];
    loginButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.59f blue:0.45f alpha:1.00f];;
//    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.cornerRadius = 7;
    
}

- (void)pressReallyLoginButton {
    
    [_delegate shouldChangeValue:_nameTextField.text :_passTextField.text];
    
    if ([_passTextField.text isEqualToString:_reallyPassTextField.text]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"密码和确认密码不同" message:@"请重新输入 " preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            NSLog(@"action = %@", action);
            self.passTextField.text = @"";
            self.reallyPassTextField.text = @"";
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            NSLog(@"action = %@", action);
        }];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
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
