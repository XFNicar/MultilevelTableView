//
//  TestViewController.m
//  MultilevelTableDemo
//
//  Created by YanYi on 2019/2/20.
//  Copyright © 2019 YanYi. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputHeight;
@property (weak, nonatomic) IBOutlet UILabel *microPhone;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.inputHeight.constant == 110) {
        [UIView animateWithDuration:0.2 animations:^{
            self.inputHeight.constant = 50;
            self.microPhone.hidden = YES;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.inputHeight.constant = 110;
            self.microPhone.hidden = NO;
        }];
    }
}

@end
