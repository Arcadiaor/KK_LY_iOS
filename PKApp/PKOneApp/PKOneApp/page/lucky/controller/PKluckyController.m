//
//  PKluckyController.m
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "PKluckyController.h"
#import "HMSegmentedControl.h"
#import "PKluckyHederView.h"
#import "PKStartCell.h"
#import "PKLabelCell.h"
#import "PKluckyChooseView.h"
#import "PKluckyDataModel.h"


@interface PKluckyController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) PKluckyHederView *headerView;
@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@property (nonatomic, strong) UITableView *CTContentView;
@property (nonatomic, strong) PKluckyChooseView *chooseView;
@property (nonatomic, copy) NSArray *chooseData;
@end

@implementation PKluckyController
-(PKluckyChooseView *)chooseView
{
    if (_chooseView == nil) {
        
        _chooseView = [[PKluckyChooseView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) luckyData:_chooseData];
    }
    return _chooseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"运势";
    self.navigationItem.leftBarButtonItem = nil;
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self setupNavigationBar];
    [self setUpChildViews];
}
-(void)loadData
{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"luckyData" ofType:@"plist"];
        NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *dataSource = [NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            PKluckyDataModel *item = [[PKluckyDataModel alloc] initWithDictionary:dict error:nil];
            [dataSource addObject:item];
        }
        self.chooseData = [dataSource copy];

}

- (void)setupNavigationBar {
    self.rightBtn.size = CGSizeMake(20, 20);
    [self.rightBtn setImage:[UIImage imageNamed:@"lucky_switch"] forState:UIControlStateNormal];
  
}

-(void)clickRightButton:(UIButton *)btn
{
    [self.chooseView showChooseView];
}

- (void)setUpChildViews {
    
    self.headerView = [[PKluckyHederView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
    self.headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headerView];
    
    
    self.segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"今日",@"明日",@"本周",@"当月",@"年度"]];
    self.segmentControl.frame = CGRectMake(15, self.headerView.buttom + 20, self.view.width - 30, 22);
    self.segmentControl.selectionIndicatorLocation  = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentControl.selectionIndicatorColor = [UIColor blackColor];
    self.segmentControl.titleTextAttributes = @{
                                                NSFontAttributeName : [UIFont systemFontOfSize:13.0f],
                                                NSForegroundColorAttributeName : [UIColor lightGrayColor]
                                                };
    self.segmentControl.selectedTitleTextAttributes = @{
                                                        NSFontAttributeName : [UIFont systemFontOfSize:15.0f],
                                                        NSForegroundColorAttributeName : [UIColor blackColor]
                                                        };
    self.segmentControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0,0, 0);
    self.segmentControl.selectionIndicatorHeight = 2;
    self.segmentControl.borderType = HMSegmentedControlBorderTypeBottom;
    self.segmentControl.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f];
    self.segmentControl.borderWidth = 0.5f;
    [self.view addSubview:self.segmentControl];
  
    
    
    self.CTContentView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.segmentControl.buttom + 10, LYSCREENWIDTH, self.view.height - self.segmentControl.buttom - 10) style:UITableViewStylePlain];
    self.CTContentView.delegate = self;
    self.CTContentView.dataSource = self;
    self.CTContentView.showsVerticalScrollIndicator = NO;
    self.CTContentView.backgroundColor = [UIColor clearColor];
    self.CTContentView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.CTContentView];
    
}

#pragma mark - UITableViewDelegate && DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    if (indexPath.row == 0)
    {
        PKStartCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil)
        {
            cell = [[PKStartCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        }
        return cell;
    }
    else
    {
        PKLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil)
        {
            cell = [[PKLabelCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        }
         return cell;
    }
}
 -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }
    else
    {
        return 50;
    }
}
@end
