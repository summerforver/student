//
//  AddViewController.h
//  student
//
//  Created by 王一卓 on 2018/8/7.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol ChangeValueDelegte<NSObject>
//- (void)shouldChangeValue:(NSString *)nameString :(NSString *)numberString :(NSString *)classString :(NSString *)sexString :(NSString *)scoreString;
//@end

@interface AddViewController : UIViewController

@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UITextField *numTextField;
@property (nonatomic, strong)UITextField *classTextField;

@property (nonatomic, strong)UITextField *scoreTextField;
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UIButton *rightButton;
@property (nonatomic, strong)UITableView *tableView;
@property BOOL isSticked;
//@property (nonatomic, weak)id<ChangeValueDelegte> delegate;

@end
