//
//  MultilevelTableDataModel.h
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const kBaseTVCellId = @"MultilevelBaseTVCell";
static NSString * const kMenuTVCellId = @"MultilevelMenuTVCell";

@interface MultilevelTableDataModel : NSObject

@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger secondMenuNum;  // 有几个二级菜单
@property (nonatomic, copy  ) NSString  *cellId;
@property (nonatomic, assign) double    cellHeight;
@property (nonatomic, assign) NSInteger selectionIndex; // 选中一级以下菜单中的第几个分类
@property (nonatomic, copy  ) NSArray <NSString *>* titles;


@end

NS_ASSUME_NONNULL_END
