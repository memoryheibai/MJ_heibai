//
//  MyCollectionTableViewCell.h
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import <UIKit/UIKit.h>

@interface MyCollectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *messageImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
