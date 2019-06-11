//
//  PKStartCell.m
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "PKStartCell.h"

@interface PKStartCell()
@property (nonatomic, strong) UILabel *totalLuckyLabel;
@property (nonatomic, strong) UIImageView *totalLuckyStar;
@property (nonatomic, strong) UILabel *loveLabel;
@property (nonatomic, strong) UIImageView *loveStar;
@property (nonatomic, strong) UILabel *careerLabel;
@property (nonatomic, strong) UIImageView *careerStar;
@property (nonatomic, strong) UILabel *richLabel;
@property (nonatomic, strong) UIImageView *richStar;
@property (nonatomic, strong) UILabel *businessLabel;
@property (nonatomic, strong) UILabel *businessValueLabel;
@property (nonatomic, strong) UILabel *luckyColorLabel;
@property (nonatomic, strong) UILabel *luckyColorValueLabel;
@property (nonatomic, strong) UILabel *luckyNumberLabel;
@property (nonatomic, strong) UILabel *luckyNumberValueLabel;
@property (nonatomic, strong) UILabel *matchCTLabel;
@property (nonatomic, strong) UILabel *matchValueCTLabel;
@property (nonatomic, strong) UILabel *shortComment;
@end

@implementation PKStartCell

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
    self.totalLuckyLabel = [self returnLabelWithName:@"整体运势:"];
    self.totalLuckyStar = [self returnImageViewWithDefaultName:@"lucky_star_0"];
    
    self.loveLabel = [self returnLabelWithName:@"爱情运势:"];
    self.loveStar = [self returnImageViewWithDefaultName:@"lucky_star_0"];
    
    self.careerLabel = [self returnLabelWithName:@"事业学业:"];
    self.careerStar = [self returnImageViewWithDefaultName:@"lucky_star_0"];
    
    self.richLabel = [self returnLabelWithName:@"财富运势:"];
    self.richStar = [self returnImageViewWithDefaultName:@"lucky_star_0"];
    
    self.luckyColorLabel = [self returnLabelWithName:@"幸运颜色:"];
    self.luckyColorValueLabel = [self returnLabelWithName:@""];
    
    self.businessLabel = [self returnLabelWithName:@"商业指数:"];
    self.businessValueLabel = [self returnLabelWithName:@""];
    
    self.matchCTLabel = [self returnLabelWithName:@"速配星座:"];
    self.matchValueCTLabel = [self returnLabelWithName:@""];
    
    self.luckyNumberLabel = [self returnLabelWithName:@"幸运数字:"];
    self.luckyNumberValueLabel = [self returnLabelWithName:@""];
    
    self.shortComment = [self returnLabelWithName:@"非常棒"];
    self.shortComment.textColor = [UIColor whiteColor];
    self.shortComment.textAlignment = NSTextAlignmentCenter;
    self.shortComment.backgroundColor = [UIColor getRandomColor];
    self.shortComment.clipsToBounds = YES;
    self.shortComment.layer.cornerRadius = 5.f;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.shortComment sizeToFit];
    self.shortComment.size = CGSizeMake(self.shortComment.width + 8, self.shortComment.height + 5);
    self.shortComment.centerX = self.centerX;
    self.shortComment.y = 15;
    
    [self.totalLuckyLabel sizeToFit];
    [self.loveLabel sizeToFit];
    [self.richLabel sizeToFit];
    [self.careerLabel sizeToFit];
    [self.luckyNumberValueLabel sizeToFit];
    [self.luckyNumberLabel sizeToFit];
    [self.luckyColorValueLabel sizeToFit];
    [self.luckyColorLabel sizeToFit];
    [self.businessValueLabel sizeToFit];
    [self.businessLabel sizeToFit];
    [self.matchValueCTLabel sizeToFit];
    [self.matchCTLabel sizeToFit];
    
    self.totalLuckyLabel.origin = CGPointMake(15, self.shortComment.buttom + 15);
    self.totalLuckyStar.x = self.totalLuckyLabel.right + 1;
    self.totalLuckyStar.centerY = self.totalLuckyLabel.centerY;
    
    self.loveStar.x = self.width - 78 - 15;
    self.loveStar.centerY = self.totalLuckyLabel.centerY;
    self.loveLabel.x = self.width - self.loveStar.width - self.loveLabel.width - 16;
    self.loveLabel.centerY = self.totalLuckyLabel.centerY;
    
    self.careerLabel.origin = CGPointMake(15, self.totalLuckyLabel.buttom + 10);
    self.careerStar.x = self.careerLabel.right + 1;
    self.careerStar.centerY = self.careerLabel.centerY;
    
    self.richStar.x = self.loveStar.x;
    self.richStar.centerY = self.careerLabel.centerY;
    self.richLabel.x = self.loveLabel.x;
    self.richLabel.centerY = self.careerLabel.centerY;
    
    if (self.businessValueLabel.text.length == 0) {
        self.businessValueLabel.hidden = YES;
        self.businessLabel.hidden = YES;
        self.luckyNumberValueLabel.hidden = YES;
        self.luckyNumberLabel.hidden = YES;
        if (self.matchValueCTLabel.text.length == 0) {
            self.luckyColorValueLabel.hidden = YES;
            self.luckyColorLabel.hidden = YES;
            self.matchValueCTLabel.hidden = YES;
            self.matchCTLabel.hidden = YES;
        } else {
            self.luckyColorValueLabel.hidden = NO;
            self.luckyColorLabel.hidden = NO;
            self.matchValueCTLabel.hidden = NO;
            self.matchCTLabel.hidden = NO;
            self.matchCTLabel.x = self.richLabel.x;
            self.matchCTLabel.centerY = self.luckyColorLabel.centerY;
            self.matchValueCTLabel.x = self.matchCTLabel.right + 1;
            self.matchValueCTLabel.centerY = self.luckyColorLabel.centerY;
        }
    } else {
        self.businessValueLabel.hidden = NO;
        self.businessLabel.hidden = NO;
        self.luckyNumberValueLabel.hidden = NO;
        self.luckyNumberLabel.hidden = NO;
        self.luckyColorValueLabel.hidden = NO;
        self.luckyColorLabel.hidden = NO;
        self.matchValueCTLabel.hidden = NO;
        self.matchCTLabel.hidden = NO;
        self.luckyColorLabel.origin = CGPointMake(15, self.careerLabel.buttom + 10);
        self.luckyColorValueLabel.x = self.luckyColorLabel.right + 1;
        self.luckyColorValueLabel.centerY = self.luckyColorLabel.centerY;
        
        self.businessLabel.x = self.richLabel.x;
        self.businessLabel.centerY = self.luckyColorLabel.centerY;
        self.businessValueLabel.x = self.businessLabel.right + 1;
        self.businessValueLabel.centerY = self.businessLabel.centerY;
        
        self.matchCTLabel.origin = CGPointMake(15, self.luckyColorLabel.buttom + 10);
        self.matchValueCTLabel.x = self.matchCTLabel.right + 1;
        self.matchValueCTLabel.centerY = self.matchCTLabel.centerY;
        
        self.luckyNumberLabel.origin = CGPointMake(15, self.luckyNumberLabel.buttom + 10);
        self.luckyNumberValueLabel.x = self.luckyNumberLabel.right + 1;
        self.luckyNumberValueLabel.centerY = self.luckyNumberLabel.centerY;
        
        self.luckyNumberLabel.x = self.richLabel.x;
        self.luckyNumberLabel.centerY = self.matchCTLabel.centerY;
        self.luckyNumberValueLabel.x = self.luckyNumberLabel.right + 1;
        self.luckyNumberValueLabel.centerY = self.luckyNumberLabel.centerY;
    }
}

- (UILabel *)returnLabelWithName:(NSString *)name {
    UILabel *label = [[UILabel alloc] init];
    label.text = name;
    label.font = [UIFont systemFontOfSize:13];
    if (name.length == 0) {
        label.textColor = [UIColor purpleColor];
    } else {
        label.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    }
    [self addSubview:label];
    return label;
}
-(UIImageView *)returnImageViewWithDefaultName:(NSString *)imageName
{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 78, 15)];
    imageV.image = [UIImage imageNamed:imageName];
    [self addSubview:imageV];
    return imageV;
    
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
