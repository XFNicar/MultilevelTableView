//
//  MultilevelTableDataManager.h
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultilevelTableDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MultilevelTableDataManager : NSObject

@property (nonatomic, strong) NSMutableArray <NSMutableArray<MultilevelTableDataModel *>*>* dataSource;
@property (nonatomic, assign) NSInteger currentSection;

- (void)configDataSource;
- (void)updateDataWithModel:(MultilevelTableDataModel *)model;

@end

NS_ASSUME_NONNULL_END
