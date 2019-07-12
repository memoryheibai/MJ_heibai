//
//  PersonTableViewCell.h
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import <UIKit/UIKit.h>

@interface PersonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *personTitleImageView;
@property (weak, nonatomic) IBOutlet UILabel *personCatgaryLabel;

//自定义cell
+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
