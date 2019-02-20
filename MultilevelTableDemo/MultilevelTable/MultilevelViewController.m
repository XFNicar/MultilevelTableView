//
//  MultilevelViewController.m
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import "MultilevelViewController.h"
#import "MultilevelBaseTVCell.h"
#import "MultilevelTableDataManager.h"

@interface MultilevelViewController ()<UITableViewDelegate,UITableViewDataSource,MultilevelTVCellDelegate>

@property (nonatomic, strong) MultilevelTableDataManager *dataManager;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MultilevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataManager = [MultilevelTableDataManager new];
    [self.dataManager configDataSource];
    [self.tableView registerNib:[UINib nibWithNibName:@"MultilevelBaseTVCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kBaseTVCellId];
    [self.tableView registerNib:[UINib nibWithNibName:@"MultilevelMenuTVCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kMenuTVCellId];
}

- (void)multilevelTVCel:(MultilevelBaseTVCell *)cell didSelectedMenu:(MultilevelTableDataModel *)model {
    [self.dataManager updateDataWithModel:model];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:model.section];
    [self.tableView beginUpdates];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MultilevelTableDataModel *model = self.dataManager.dataSource[indexPath.section][indexPath.row];
    model.section = indexPath.section;
    model.row = indexPath.row;
    MultilevelBaseTVCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellId];
    [cell updateWithModel:model];
    cell.delegate = self;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataManager.dataSource[section].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataManager.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataManager.dataSource[indexPath.section][indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MultilevelTableDataModel *model = self.dataManager.dataSource[indexPath.section][indexPath.row];
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc]init];
    [indexSet addIndex: self.dataManager.currentSection];
    [self.dataManager updateDataWithModel:model];
    [indexSet addIndex: self.dataManager.currentSection];
    [tableView beginUpdates];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}


@end
