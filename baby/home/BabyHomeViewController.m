//
//  BabyHomeViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import "BabyHomeViewController.h"
#import "HomeTableViewCell.h"
#import "MyRecommendViewController.h"
#import "MyQuestionViewController.h"
#import "MyCollectionViewController.h"

@interface BabyHomeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
}

@end

@implementation BabyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    self.homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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

#pragma mark - UITableviewDelegate && UITableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellTableIndentifier = @"HomeTableViewCell";
    //单元格ID
    //重用单元格
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化单元格
    if(cell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        //xib文件
        cell = [nib objectAtIndex:0];
    }
    
    cell.titleLabel.text = @"宝贝应该怎么睡";
    cell.messageLabel.text = @"宝贝的标准睡姿应该是怎样的呢，如何避免错误睡姿";
    cell.userNameLabel.text = @"XXX发布";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    if (indexPath.row == 0) {
        MyRecommendViewController *recommend = [sb instantiateViewControllerWithIdentifier:@"myRecommend"];
        [self.navigationController pushViewController:recommend animated:YES];
        //[self performSegueWithIdentifier:@"mytuijian" sender:nil];
    }else if(indexPath.row == 1){
        MyQuestionViewController *question = [sb instantiateViewControllerWithIdentifier:@"myQuestion"];
        [self.navigationController pushViewController:question animated:YES];
        //[self performSegueWithIdentifier:@"myquestion" sender:nil];
    }else if (indexPath.row == 2){
        MyCollectionViewController *collection = [sb instantiateViewControllerWithIdentifier:@"myCollection"];
        [self.navigationController pushViewController:collection animated:YES];
       // [self performSegueWithIdentifier:@"mycollection" sender:nil];
    }else{
        
    }
}

@end
