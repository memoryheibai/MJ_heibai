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
//    NSDictionary *users = [ud objectForKey:@"users"];
//    if (users == nil || [users objectForKey:self.accountTF.text] == nil) {
//        //提示没有该账号
//    } else {
//        NSString *password = [users objectForKey:self.accountTF.text];
//        if([self.passwordTF.text isEqualToString:password]) {
//            //登录成功
//
//            [ud setObject:self.accountTF.text forKey:@"user_name"];
//        } else {
            //登录失败，密码不对
             [self dismissViewControllerAnimated:YES completion:^{
                
            }];
//        }
//    }

  
}



@end
