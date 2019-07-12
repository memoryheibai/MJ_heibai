//
//  PersonCenterViewController.h
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import <UIKit/UIKit.h>

@interface PersonCenterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *personTableView;
@property (weak, nonatomic) IBOutlet UILabel *personNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personHeadImageView;

@end
