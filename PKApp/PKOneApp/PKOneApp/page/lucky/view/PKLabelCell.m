//
//  PKLabelCell.m
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "PKLabelCell.h"
@interface PKLabelCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) UIView *backView;

@end

@implementation PKLabelCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setUpChildView];
    }
    return self;
    
}
-(void)setUpChildView
{
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1f];
    self.backView.layer.cornerRadius = 10.f;
    self.backView.clipsToBounds = YES;
    [self addSubview:self.backView];
    
    self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lucky_icon"]];
    [self addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor purpleColor];
    [self addSubview:self.titleLabel];
    
    self.separatorLine  = [[UIView alloc] init];
    self.separatorLine.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f];
    [self addSubview:self.separatorLine];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.font = [UIFont systemFontOfSize:13];
    self.detailLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    self.detailLabel.numberOfLines = 0.f;
    [self addSubview:self.detailLabel];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconImageView.frame = CGRectMake(15, 5, 20, 20);
    self.titleLabel.size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 20 - self.iconImageView.right, 16);
    self.titleLabel.centerY = self.iconImageView.centerY ;
    self.titleLabel.x = self.iconImageView.right + 5;
    
    self.separatorLine.frame = CGRectMake(self.iconImageView.right, self.titleLabel.buttom, [UIScreen mainScreen].bounds.size.width - self.iconImageView.right - 15, 1);
    
    self.detailLabel.origin = CGPointMake(15, self.titleLabel.buttom + 10);
    self.detailLabel.width = [UIScreen mainScreen].bounds.size.width - 30;
    [self.detailLabel sizeToFit];
    
    self.backView.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, self.detailLabel.buttom + 5);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
