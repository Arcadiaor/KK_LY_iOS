//
//  PKluckyChooseView.m
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "PKluckyChooseView.h"
#import "PKCollectionViewCell.h"
#import "PKluckyDataModel.h"

@interface PKluckyChooseView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UIButton *closeButton;
@property(nonatomic,strong)UICollectionView *chooseView;
@property(nonatomic,copy)NSArray *dataArray;
@end

@implementation PKluckyChooseView
-(instancetype)initWithFrame:(CGRect)frame luckyData:(NSArray *)dataSource
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
        self.dataArray = dataSource;
    }
    return self;
}
-(void)setUpSubviews
{
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.95f];
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeButton setImage:[UIImage imageNamed:@"today_closeButton"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30)/3, 120);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    
    self.chooseView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, LYNAVIGATION_BAR_HEIGHT, LYSCREENWIDTH - 30, LYSCREENHEIGHT-75 - LYNAVIGATION_BAR_HEIGHT) collectionViewLayout:layout];
    self.chooseView.delegate = self;
    self.chooseView.dataSource = self;
    self.chooseView.backgroundColor = [UIColor clearColor];
    [self.chooseView registerClass:[PKCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    [self addSubview:self.chooseView];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.closeButton.size = CGSizeMake(20, 20);
    self.closeButton.y = [UIScreen mainScreen].bounds.size.height - 45 - 20;
    self.closeButton.centerX = self.centerX;
    self.chooseView.frame = CGRectMake(15, LYNAVIGATION_BAR_HEIGHT, LYSCREENWIDTH - 30, LYSCREENHEIGHT- self.closeButton.height - 45 - LYNAVIGATION_BAR_HEIGHT);
    
}

- (void)clickCloseButton:(UIButton *)sender
{
    [self dismissFromSuperView];
}

- (void)dismissFromSuperView {
    [UIView animateWithDuration:0.3f animations:^{
        self.y = LYSCREENHEIGHT;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

-(void)showChooseView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window endEditing:YES];
    [window addSubview:self];
    if (self.y == [UIScreen mainScreen].bounds.size.height) {
        [UIView animateWithDuration:0.3f animations:^{
            self.y = 0;
        } completion:^(BOOL finished) {
        }];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //自定义cell  PKCollectionViewCell
    PKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[PKCollectionViewCell alloc]init];
    }
    PKluckyDataModel *data = self.dataArray[indexPath.row];
    cell.data = data;
    
    return cell;
}
@end
