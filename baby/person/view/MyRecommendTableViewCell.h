//
//  MyRecommendTableViewCell.h
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import <UIKit/UIKit.h>

@interface MyRecommendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *messageImageView;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
