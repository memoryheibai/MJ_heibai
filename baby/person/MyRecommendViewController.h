//
//  MyRecommendViewController.h
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import <UIKit/UIKit.h>

@interface MyRecommendViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *myRecommandTableView;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
- (IBAction)back:(id)sender;

@end
