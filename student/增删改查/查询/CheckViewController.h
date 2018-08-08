//
//  CheckViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMessage.h"

@interface CheckViewController : UIViewController

@property (nonatomic, strong)UITextField *checkTextField;
@property (nonatomic, strong)UITableView *tableView;
@property StudentMessage *a;

@end
