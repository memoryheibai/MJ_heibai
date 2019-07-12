//
//  MyQuestionTableViewCell.h
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import <UIKit/UIKit.h>

@interface MyQuestionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
