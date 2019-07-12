//
//  MyCollectionViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import "MyCollectionViewController.h"
#import "MyCollectionTableViewCell.h"

@interface MyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *imageListArr;
    NSArray *titleArr;
    NSArray *messageArr;
    NSArray *timeArr;
}

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myCollectionTableView.delegate = self;
    self.myCollectionTableView.dataSource = self;
    self.myCollectionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    titleArr = [NSArray arrayWithObjects:@"宝贝应该怎样睡",@"宝妈感冒了，还能给孩子喂奶吗", nil];
    messageArr = [NSArray arrayWithObjects:@"宝贝的标准睡姿应该是怎样的呢", @"很多宝妈都会担心，如果自己感冒发烧，还能给宝贝喂母乳吗",nil];
    imageListArr = [NSArray arrayWithObjects:@"recommend1",@"recommend2", nil];
    timeArr = [NSArray arrayWithObjects:@"APP 昵称发布 2019-07-08",@"APP 昵称发布 2019-07-07", nil];
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
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
