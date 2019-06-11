//
//  PKCollectionViewCell.m
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "PKCollectionViewCell.h"

@interface PKCollectionViewCell()

@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UILabel *ctNameLabel;

@end

@implementation PKCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpViews];
    }
    return self;
}
-(void)setUpViews
{
    self.logoView = [[UIImageView alloc]init];
    self.logoView.size = CGSizeMake(60, 60);
    self.logoView.clipsToBounds = YES;
    self.logoView.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f].CGColor;
    self.logoView.layer.borderWidth = 1.f;
    self.logoView.layer.cornerRadius = 30;
    [self addSubview:self.logoView];
    
    self.ctNameLabel = [[UILabel alloc] init];
    self.ctNameLabel.font = [UIFont systemFontOfSize:10.f];
    self.ctNameLabel.textColor = [UIColor blackColor];
    self.ctNameLabel.numberOfLines = 2;
    self.ctNameLabel.textAlignment = NSTextAlignmentCenter;
    self.ctNameLabel.text = [NSString stringWithFormat:@"xxx"];
    [self addSubview:self.ctNameLabel];
    
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.logoView.centerX = self.contentView.centerX;
    self.logoView.y = 5;
    
    [self.ctNameLabel sizeToFit];
    self.ctNameLabel.centerX = self.contentView.centerX;
    self.ctNameLabel.top = self.logoView.buttom + 10;
}

-(void)setData:(PKluckyDataModel *)data
{
    
    self.logoView.image = [UIImage imageNamed:data.imageName];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@",data.date,data.chineseName]];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(attStr.length - 3, 3)];
    self.ctNameLabel.attributedText = attStr;
    
}
@end
