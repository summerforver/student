//
//  ChangeViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UITextField *changeTextField;

//@property (nonatomic, strong)UITextField *nameTextField;
//@property (nonatomic, strong)UITextField *numTextField;
//@property (nonatomic, strong)UITextField *classTextField;
//@property (nonatomic, strong)UITextField *sexTextField;
//@property (nonatomic, strong)UITextField *scoreTextField;

@end
