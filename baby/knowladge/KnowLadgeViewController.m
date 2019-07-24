//
//  KnowLadgeViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import "KnowLadgeViewController.h"
#import "MyCollectionTableViewCell.h"

@interface KnowLadgeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *imageListArr;
    NSArray *titleArr;
    NSArray *messageArr;
    NSArray *timeArr;
}

@end

@implementation KnowLadgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.knowTableView.delegate = self;
    self.knowTableView.dataSource = self;
    self.knowTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    titleArr = [NSArray arrayWithObjects:@"宝贝应该怎样睡",@"宝妈感冒了，还能给孩子喂奶吗", @"宝贝流口水的原因是什么",nil];
    messageArr = [NSArray arrayWithObjects:@"宝贝的标准睡姿应该是怎样的呢", @"很多宝妈都会担心，如果自己感冒发烧，还能给宝贝喂母乳吗",@"宝贝流口水很常见，出现的具体原因是什么",nil];
    imageListArr = [NSArray arrayWithObjects:@"recommend1",@"recommend2",@"recommend1" ,nil];
    timeArr = [NSArray arrayWithObjects:@"APP 昵称发布 2019-07-08",@"APP 昵称发布 2019-07-07", @"APP 昵称发布 2019-07-06", nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellTableIndentifier = @"MyCollectionTableViewCell";
    //单元格ID
    //重用单元格
    MyCollectionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化单元格
    if(cell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MyCollectionTableViewCell" owner:self options:nil];
        //xib文件
        cell = [nib objectAtIndex:0];
    }
    
    cell.titleLabel.text = titleArr[indexPath.row];
    cell.messageLabel.text = messageArr[indexPath.row];
    cell.messageImageView.image = [UIImage imageNamed:imageListArr[indexPath.row]];
    cell.timeLabel.text = timeArr[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"mytuijian" sender:nil];
    }
}

@end
