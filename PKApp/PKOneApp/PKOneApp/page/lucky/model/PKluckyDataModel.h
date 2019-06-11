//
//  PKluckyDataModel.h
//  PKOneApp
//
//  Created by Arcadia on 2019/6/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PKluckyDataModel : JSONModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *chineseName;

@end

NS_ASSUME_NONNULL_END
