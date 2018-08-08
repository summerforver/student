//
//  ViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UITextField *passTextField;
@property (nonatomic, strong)UIButton *submitButton;
@property (nonatomic, strong)UIButton *loginButton;
@property (nonatomic, strong)NSMutableArray *personMutableArray;
@property (nonatomic, strong)NSMutableArray *passMutableArray;

@end

