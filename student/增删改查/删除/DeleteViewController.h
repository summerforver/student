//
//  DeleteViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMessage.h"

@interface DeleteViewController : UIViewController

@property (nonatomic, strong)UITextField *deleteTextField;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIButton *deleteReallyButton;
@property StudentMessage *a;
@property int flagAll;
@end
