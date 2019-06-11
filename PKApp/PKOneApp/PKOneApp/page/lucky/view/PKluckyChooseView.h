//
//  PKluckyChooseView.h
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKluckyChooseView : UIView
-(void)showChooseView;
-(instancetype)initWithFrame:(CGRect)frame luckyData:(NSArray *)dataSource;
@end

NS_ASSUME_NONNULL_END
