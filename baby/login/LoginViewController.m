//
//  LoginViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginBtnClicked:(id)sender {
    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    [ud setObject:self.accountTF.text forKey:@"user_name"];
//    [ud setObject:self.passwordTF.text forKey:@"password"];

    [self dismissViewControllerAnimated:YES completion:^{

    }];
}

@end
