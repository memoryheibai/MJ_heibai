//
//  MainTabBarViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import "MainTabBarViewController.h"
#import "login/LoginViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *user_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
    if(user_name != nil) {
        
    } else {
        UIStoryboard*sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *login=[sb instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController presentViewController:login animated:NO completion:^{
            
        }];
    }
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

@end
