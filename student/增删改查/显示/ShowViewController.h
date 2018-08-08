//
//  ShowViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMessage.h"

@interface ShowViewController : UIViewController 

@property (nonatomic, strong)UITableView *tableView;
//@property (nonatomic, strong)NSMutableArray *nameMutableArray;
//@property (nonatomic, strong)NSMutableArray *numberMutableArray;
//@property (nonatomic, strong)NSMutableArray *classMutableArray;
//@property (nonatomic, strong)NSMutableArray *sexMutableArray;
//@property (nonatomic, strong)NSMutableArray *scoreMutableArray;
@property NSMutableArray *studentMutableArray;

@end
