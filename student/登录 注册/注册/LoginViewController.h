//
//  LoginViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ChangeValueDelegte<NSObject>

- (void)shouldChangeValue:(NSString *)nameString :(NSString *)passString;

@end

@interface LoginViewController : UIViewController

//@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UITextField *passTextField;
@property (nonatomic, strong)UITextField *reallyPassTextField;
@property (nonatomic, strong)UIButton *reallyLoginButton;

@property (nonatomic, strong) UITextField *nameTextField;

@property (nonatomic, weak)id<ChangeValueDelegte> delegate;

@end
