//
//  MultilevelBaseTVCell.h
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MultilevelBaseTVCell;
@class MultilevelTableDataModel;

@protocol MultilevelTVCellDelegate <NSObject>

- (void)multilevelTVCel:(MultilevelBaseTVCell *)cell didSelectedMenu:(MultilevelTableDataModel * )model;

@end

@interface MultilevelBaseTVCell : UITableViewCell

@property (nonatomic, weak  ) id <MultilevelTVCellDelegate> delegate;

- (void)updateWithModel:(MultilevelTableDataModel *)model;
- (UILabel *)createLable:(NSString *)title tag:(NSInteger)tag;
- (void)didSelectedCurrentMenu:(UIButton *)sender;
- (UIButton *)createButton:(NSString *)title tag:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
