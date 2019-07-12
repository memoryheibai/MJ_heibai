//
//  PersonCenterViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import "PersonCenterViewController.h"
#import "PersonTableViewCell.h"
@interface PersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *listArr;
    NSArray *imageListArr;
}


@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.personTableView.delegate = self;
    self.personTableView.dataSource = self;
    self.personTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.personTableView.scrollEnabled = NO;

    listArr = [NSArray arrayWithObjects:@"我的推荐",@"我的提问",@"我的收藏",@"退出", nil];
    imageListArr = [NSArray arrayWithObjects:@"myRecommend",@"myQuestion",@"myCollection",@"logOut", nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableviewDelegate && UITableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellTableIndentifier = @"PersonTableViewCell";
    //单元格ID
    //重用单元格
    PersonTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化单元格
    if(cell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"PersonTableViewCell" owner:self options:nil];
        //xib文件
        cell = [nib objectAtIndex:0];
    }
    
    cell.personCatgaryLabel.text = listArr[indexPath.row];
    cell.personTitleImageView.image = [UIImage imageNamed:imageListArr[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"mytuijian" sender:nil];
    }else if(indexPath.row == 1){
        [self performSegueWithIdentifier:@"myquestion" sender:nil];
    }else if (indexPath.row == 2){
        [self performSegueWithIdentifier:@"mycollection" sender:nil];
    }else{
        
    }
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
