//
//  RegisteViewController.m
//  baby
//
//  Created by Polery on 2019/7/16.
//

#import "RegisteViewController.h"
#import "LoginViewController.h"

@interface RegisteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTF;

@end

@implementation RegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)registeBtnClicked:(id)sender {
    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud setObject:self.accountTF.text forKey:@"user_name"];
//    [ud setObject:self.passwordTF.text forKey:@"password"];

    UIViewController *vc = self.presentingViewController;
    while (![vc isKindOfClass:[UINavigationController class]]) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:^{

    }];
}

@end
