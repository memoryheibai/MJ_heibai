//
//  MyRecommendViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import "MyRecommendViewController.h"
#import "MyRecommendTableViewCell.h"
@interface MyRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *imageListArr;
    NSArray *titleArr;
    NSArray *messageArr;
}

@end

@implementation MyRecommendViewController

//是否需要显示导航栏


#pragma mark - system framework
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //是否显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myRecommandTableView.delegate = self;
    self.myRecommandTableView.dataSource = self;
    self.myRecommandTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    titleArr = [NSArray arrayWithObjects:@"宝贝爱吃手，宝妈可别急",@"宝宝爱咬人，怎么办", nil];
    messageArr = [NSArray arrayWithObjects:@"宝贝爱吃手，各位宝妈可先别急着喊停，正确应对才是好的", @"宝贝爱咬人，我们教你机智应对",nil];
    imageListArr = [NSArray arrayWithObjects:@"recommend1",@"recommend2", nil];

}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableviewDelegate && UITableViewDatasource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellTableIndentifier = @"MyRecommendTableViewCell";
    //单元格ID
    //重用单元格
    MyRecommendTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化单元格
    if(cell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MyRecommendTableViewCell" owner:self options:nil];
        //xib文件
        cell = [nib objectAtIndex:0];
    }
    
    cell.titleLabel.text = titleArr[indexPath.row];
    cell.statusLabel.text = @"审核中";
    cell.messageLabel.text = messageArr[indexPath.row];
    cell.messageImageView.image = [UIImage imageNamed:imageListArr[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"mytuijian" sender:nil];
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
