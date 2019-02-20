//
//  MultilevelBaseTVCell.m
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/19.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import "MultilevelBaseTVCell.h"
#import "MultilevelTableDataModel.h"

@implementation MultilevelBaseTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithModel:(MultilevelTableDataModel *)model {
//    while (self.subviews.count > 0) {
//        [self.subviews.lastObject removeFromSuperview];
//    }
//
//    NSInteger count = model.titles.count;
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    for (NSInteger index = 0 ; index < count ; index ++) {
//        NSString * title = model.titles[index];
//        UILabel *lab = [self createLable:title tag:100+index];
//        lab.frame = CGRectMake(screenWidth*index/count, 0, screenWidth/count, 50);
//        [self addSubview:lab];
//    }

}

- (UILabel *)createLable:(NSString *)title tag:(NSInteger)tag {
    
    UILabel *label          = [[UILabel alloc]init];
    label.textAlignment     = NSTextAlignmentCenter;
    label.textColor         = [UIColor lightGrayColor];
    label.backgroundColor   = [UIColor clearColor];
    label.font              = [UIFont systemFontOfSize:20];
    label.text              = title;
    label.tag               = tag;
    return label;
}

- (UIButton *)createButton:(NSString *)title tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(didSelectedCurrentMenu:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}

- (void)didSelectedCurrentMenu:(UIButton *)sender {
    
}

@end
