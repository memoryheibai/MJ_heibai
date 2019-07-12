//
//  ReleaseViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/11.
//

#import "ReleaseViewController.h"
#import "ReleaseTableViewCell.h"
@interface ReleaseViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *imageListArr;
    NSArray *titleArr;
    NSArray *messageArr;

}

@end

@implementation ReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.releaseTableview.delegate = self;
    self.releaseTableview.dataSource = self;
    self.releaseTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.releaseTableview.scrollEnabled = NO;
    
    titleArr = [NSArray arrayWithObjects:@"提问",@"推荐", nil];
    imageListArr = [NSArray arrayWithObjects:@"tiwen",@"tuijian", nil];
    messageArr = [NSArray arrayWithObjects:@"提出你的疑惑，我们来解答",@"发表你的心得体会，分享给各位宝妈", nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - UITableviewDelegate && UITableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    
    static NSString *CellTableIndentifier = @"ReleaseTableViewCell";
    //单元格ID
    //重用单元格
    ReleaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化单元格
    if(cell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"ReleaseTableViewCell" owner:self options:nil];
        //xib文件
        cell = [nib objectAtIndex:0];
    }
    
    cell.messageTypeImageView.image = [UIImage imageNamed:imageListArr[indexPath.row]];
    cell.titleLabel.text = titleArr[indexPath.row];
    cell.messageLabel.text = messageArr[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"newrelease" sender:nil];
    }else{
        [self performSegueWithIdentifier:@"newquestion" sender:nil];
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
