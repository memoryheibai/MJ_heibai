//
//  HomeTableViewCell.h
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *messageImageView;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
