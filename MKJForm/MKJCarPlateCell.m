//
//  MKJCarPlateCell.m
//  MKJForm
//
//  Created by MKJING on 16/9/6.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import "MKJCarPlateCell.h"
#import <LGAlertView.h>

NSString * const XLFormRowDescriporTypeCar = @"XLFormRowDescriporTypeCar";

@interface MKJCarPlateCell () <UITextFieldDelegate>


@end

@implementation MKJCarPlateCell


// 在主表单中加入一组Key Value 自定义的必须重写
+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([MKJCarPlateCell class]) forKey:XLFormRowDescriporTypeCar];
}

// 这个方法是用来设置属性的 必须重写  类似于初始化的属性不变的属性进行预先配置
- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.clickView.layer.borderColor = [UIColor yellowColor].CGColor;
    self.clickView.layer.borderWidth = 1.0f;
    self.rightTextField.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseCountry:)];
    [self.clickView addGestureRecognizer:tap];
}

// 这个方法是用来进行更新的，外面给唯一的字段Value设定值就好了 通过self.rowDescriptor.value的值变化来进行更新
- (void)update
{
    [super update];
    NSDictionary *value = self.rowDescriptor.value;
    self.countryName.text = [value objectForKey:@"country"];
    self.rightTextField.text = [value objectForKey:@"number"];
    
}

- (void)chooseCountry:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.5 animations:^{
        self.downArrow.transform = CGAffineTransformMakeRotation(-M_PI);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"A lot of country"
                                                            message:@"You can scroll it"
                                                              style:LGAlertViewStyleAlert
                                                       buttonTitles:@[@"京",
                                                                      @"浙",
                                                                      @"沪",
                                                                      @"黑",
                                                                      @"港",
                                                                      @"深",
                                                                      @"广",
                                                                      @"川",
                                                                      @"赣",
                                                                      @"粤",
                                                                      @"叼",
                                                                      @"这",
                                                                      @"个",
                                                                      @"可",
                                                                      @"以",
                                                                      @"有",]
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:@"确定"
                                                      actionHandler:^(LGAlertView *alertView, NSString *title, NSUInteger index) {
                                                          NSLog(@"actionHandler, %@, %lu", title, (long unsigned)index);
                                                          NSMutableDictionary *value = [self.rowDescriptor.value mutableCopy];
                                                          [value setObject:title forKey:@"country"];
                                                          self.rowDescriptor.value = value;
                                                          
                                                          [UIView animateWithDuration:0.5 animations:^{
                                                              self.downArrow.transform = CGAffineTransformMakeRotation(2*M_PI);
                                                          }];
                                                          
                                                      }
                                                      cancelHandler:^(LGAlertView *alertView) {
                                                          NSLog(@"cancelHandler");
                                                          [UIView animateWithDuration:0.5 animations:^{
                                                              self.downArrow.transform = CGAffineTransformMakeRotation(2*M_PI);
                                                          }];
                                                      }
                                                 destructiveHandler:^(LGAlertView *alertView) {
                                                     NSLog(@"destructiveHandler");
                                                     [UIView animateWithDuration:0.5 animations:^{
                                                         self.downArrow.transform = CGAffineTransformMakeRotation(2*M_PI);
                                                     }];
                                                 }];
        alertView.windowLevel = LGAlertViewWindowLevelBelowStatusBar;
        alertView.heightMax = 255.f;
        [alertView showAnimated:YES completionHandler:nil];
    });
    
}

#pragma mark - TF代理
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSMutableDictionary *value = [self.rowDescriptor.value mutableCopy];
    [value setObject:textField.text forKey:@"number"];
    self.rowDescriptor.value = value;
}






+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    return 60;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 5.f;
    self.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
