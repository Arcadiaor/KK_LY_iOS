//
//  PKCollectionViewCell.h
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKluckyDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PKCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)PKluckyDataModel * data;

@end

NS_ASSUME_NONNULL_END
