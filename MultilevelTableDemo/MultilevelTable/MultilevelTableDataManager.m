//
//  MultilevelTableDataManager.m
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import "MultilevelTableDataManager.h"

@interface MultilevelTableDataManager ()

@property (nonatomic, assign) NSInteger currentLevel;

@end

@implementation MultilevelTableDataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataSource = [NSMutableArray new];
        _currentLevel = 0;
        _currentSection = 0;
    }
    return self;
}

- (void)configDataSource {
    for (NSInteger index = 0; index < 5; index ++) {
        MultilevelTableDataModel *firstLevelModel = [MultilevelTableDataModel new];
        firstLevelModel.cellId = kBaseTVCellId;
        firstLevelModel.level = 1;
        firstLevelModel.section = index;
        firstLevelModel.row = 0;
        firstLevelModel.secondMenuNum = arc4random() % 2 + 1;
        firstLevelModel.titles = @[@"一级菜单"];
        firstLevelModel.selectionIndex = 0;
        firstLevelModel.cellHeight = 120;
        NSMutableArray <MultilevelTableDataModel *>*groupSource = [NSMutableArray new];
        [groupSource addObject:firstLevelModel];
        [self.dataSource addObject:groupSource];
    }
}



- (void)updateDataWithModel:(MultilevelTableDataModel *)model { //
    if (model.level == 3) { // 不作处理
        
    } else if (model.level == 2) {
        [self addNewLevelMenu:model];
    } else {
        [self switchGroupWithModel:model];
    }
}

// 打开三级菜单
- (void)addNewLevelMenu:(MultilevelTableDataModel *)model {
    
    MultilevelTableDataModel *thirdLevelModel = [MultilevelTableDataModel new];
    thirdLevelModel.cellId = kMenuTVCellId;
    thirdLevelModel.cellHeight = 80;
    thirdLevelModel.level = 3;
    thirdLevelModel.section = model.section;
    thirdLevelModel.row = 0;
    thirdLevelModel.secondMenuNum = 1;
    if (model.selectionIndex == 0) {
        thirdLevelModel.titles = @[@"三级鞋子",@"三级鞋子",@"三级鞋子",@"三级鞋子"];
    } else {
        thirdLevelModel.titles = @[@"三级板甲",@"三级板甲",@"三级板甲",@"三级板甲"];
    }
    thirdLevelModel.selectionIndex = 0;
    
    // 移除原来的三级菜单数据
    for (;;) {
        BOOL haveThirdMenuData = NO;
        for (MultilevelTableDataModel *thirdModel in self.dataSource[model.section]) {
            if (thirdModel.level == 3) {
                [self.dataSource[model.section] removeObject:thirdModel];
                haveThirdMenuData = YES;
                break;
            }
        }
        if (haveThirdMenuData == NO) {
            break;
        }
    }

    // 插入新的三级菜单数据
    if (model.secondMenuNum > 1) {
        if (model.row >= model.secondMenuNum ) {
            [self.dataSource[model.section] addObject:thirdLevelModel];
        } else {
            [self.dataSource[model.section] insertObject:thirdLevelModel atIndex:model.row + 1];
        }
    } else {
        [self.dataSource[model.section] addObject:thirdLevelModel];
    }
    self.currentLevel = 3;
}

// 打开和关闭分组
- (void)switchGroupWithModel:(MultilevelTableDataModel *)model {
    if (model.section == self.currentSection) {
        if (self.currentLevel > 1) { // 关闭当前分组
            [self closeOldGroup:model.section];
        } else { // 打开当前分组
            [self openNewGroup:model];
        }
    } else { // 关闭当前分组，打开新分组
        [self closeOldGroup:self.currentSection];
        [self openNewGroup:model];
    }
    self.currentSection = model.section;
}

// 打开新分组
- (void)openNewGroup:(MultilevelTableDataModel *)model {
    for (NSInteger index = 0; index < self.dataSource[model.section].firstObject.secondMenuNum; index ++) {
        MultilevelTableDataModel *secondLevelModel = [MultilevelTableDataModel new];
        secondLevelModel.cellId = kMenuTVCellId;
        secondLevelModel.level = 2;
        secondLevelModel.section = model.section;
        secondLevelModel.row = 0;
        secondLevelModel.titles = @[@"二级鞋子",@"二级衣服"];
        secondLevelModel.selectionIndex = 0;
        secondLevelModel.cellHeight = 60;
        secondLevelModel.secondMenuNum = model.secondMenuNum;
        [self.dataSource[model.section] addObject:secondLevelModel];
    }
    self.currentLevel = 2;
}

// 关闭旧分组
- (void)closeOldGroup:(NSInteger)section {
    while (self.dataSource[section].count > 1) {
        [self.dataSource[section] removeLastObject];
    }
    self.currentLevel = 1;
}


@end
