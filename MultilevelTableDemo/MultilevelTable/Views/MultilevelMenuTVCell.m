//
//  MultilevelMenuTVCell.m
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import "MultilevelMenuTVCell.h"
#import "MultilevelTableDataModel.h"

@interface MultilevelMenuTVCell ()

@property (nonatomic, weak  ) MultilevelTableDataModel  *model;

@end

@implementation MultilevelMenuTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateWithModel:(MultilevelTableDataModel *)model {
    self.model = model;
    while (self.subviews.count > 0) {
        [self.subviews.lastObject removeFromSuperview];
    }
    
    NSInteger count = model.titles.count;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for (NSInteger index = 0 ; index < count ; index ++) {
        NSString * title = model.titles[index];
        UIButton *btn = [self createButton:title tag:index];
        btn.frame = CGRectMake(screenWidth*index/count, 0, screenWidth/count, model.cellHeight);
        if (model.level == 2) {
            btn.backgroundColor = [UIColor redColor];
        } else {
            btn.backgroundColor = [UIColor yellowColor];
        }
        [self addSubview:btn];
    }
    
}

- (void)didSelectedCurrentMenu:(UIButton *)sender {
    self.model.selectionIndex = sender.tag;
    if (self.delegate && [self.delegate respondsToSelector:@selector(multilevelTVCel:didSelectedMenu:)]) {
        [self.delegate multilevelTVCel:self didSelectedMenu:self.model];
    }
}

@end
