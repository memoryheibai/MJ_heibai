//
//  MyQuestionViewController.m
//  baby
//
//  Created by Guanxw on 2019/7/12.
//

#import "MyQuestionViewController.h"
#import "MyQuestionTableViewCell.h"
@interface MyQuestionViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *titleArr;
    NSArray *messageArr;
}

@end

@implementation MyQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myQuestionTableView.delegate = self;
    self.myQuestionTableView.dataSource = self;
    self.myQuestionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    titleArr = [NSArray arrayWithObjects:@"宝贝一直趴着睡，如何纠正呢",@"宝贝喝水的时候老是咳嗽，怎么办呢", nil];
    messageArr = [NSArray arrayWithObjects:@"您的问题正在审核中", @"您的问题正在审核中",nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellTableIndentifier = @"MyQuestionTableViewCell";
    //单元格ID
    //重用单元格
    MyQuestionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    //初始化单元格
    if(cell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MyQuestionTableViewCell" owner:self options:nil];
        //xib文件
        cell = [nib objectAtIndex:0];
    }
    
    cell.titleLabel.text = titleArr[indexPath.row];
    cell.questionLabel.text = messageArr[indexPath.row];
    
    return cell;
}

@end
