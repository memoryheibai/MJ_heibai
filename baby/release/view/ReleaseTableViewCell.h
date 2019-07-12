//
//  ReleaseTableViewCell.h
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import <UIKit/UIKit.h>

@interface ReleaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *messageTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
