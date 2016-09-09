//
//  MKJFormViewController.m
//  MKJForm
//
//  Created by MKJING on 16/9/6.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import "MKJFormViewController.h"
#import "MKJCarPlateCell.h"
#import "MKJFloatTextFieldCell.h"
#import "FloatLabeledTextFieldCell.h"
#import "XLFormRatingCell.h"
#import "MKJFloatTextFieldCell.h"
#import "MKJUploadImageCell.h"

@interface MKJFormViewController ()
@property (strong, nonatomic) IBOutlet UIView *headView;
@property (strong, nonatomic) IBOutlet UIView *footerView;

@end

@implementation MKJFormViewController


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initializeForm];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeForm];
    }
    return self;
}

// 初始化表单
- (void)initializeForm
{
    // 表单对象
    XLFormDescriptor *form;
    // 表单Section对象
    XLFormSectionDescriptor *section;
    // 表单Row对象
    XLFormRowDescriptor *row;
    
    // 初始化form 顺便带个title
    form = [XLFormDescriptor formDescriptorWithTitle:@"超级表单"];
    
    // 第一个Section 没有参数的
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // 第一个就要自定义 车牌号 自定义cell
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"first" rowType:XLFormRowDescriporTypeCar title:@"车牌号"];
    row.required = YES;
    row.value = @{@"country":@"浙",@"number":@"123456"};
    [section addFormRow:row];
    
    
    // 第二段
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // 第二个发动机号 自带的Cell
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"second" rowType:XLFormRowDescriptorTypeText title:@"发动机号"];
    row.required = YES;
    // font
    [row.cellConfig setObject:[UIFont boldSystemFontOfSize:16] forKey:@"textLabel.font"];
    // font
    [row.cellConfig setObject:[UIFont boldSystemFontOfSize:16] forKey:@"textField.font"];
    // alignment
    [row.cellConfig setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // 第三个底部Sheet Picker 自带Cell
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"third" rowType:XLFormRowDescriptorTypeSelectorPickerView title:@"车型"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"奥迪A4"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"丰田SUV"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"凯迪拉克"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"奔驰"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"BMW"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"雷克萨斯"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"马自达"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"本田"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"特斯拉"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(9) displayText:@"福特"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(10) displayText:@"雷诺"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(11) displayText:@"法拉利"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(12) displayText:@"宾利"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(13) displayText:@"玛莎拉蒂"]
                            ];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Option 4"];
    [section addFormRow:row];
    
    // 第四个内嵌Picker 自带Cell
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"four" rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"车长"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"1M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"2M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"3M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"4M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"5M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"6M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"7M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"8M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"9M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(9) displayText:@"10M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(10) displayText:@"11M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(11) displayText:@"12M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(12) displayText:@"13M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(13) displayText:@"14M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(14) displayText:@"15M"],
                            ];
    [section addFormRow:row];
    
    // 第五个浮动TF 自带cell
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"five" rowType:XLFormRowDescriptorTypeFloatLabeledTextField111 title:@"请输入体积大小"];
    [section addFormRow:row];
    
    // 第六个测试下  自定义cell
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"six" rowType:XLFormRowDescriporTypeFloat title:@"请输入面积大小"];
    row.value = @{@"left":@"面积(m³)",@"right":@""};
    [section addFormRow:row];
    
    // 第七个评分 自带cell
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"seven" rowType:XLFormRowDescriptorTypeRate title:@"First Rating"];
    row.value = @(3);
    [section addFormRow:row];
    
    
    // 测试新增栏目  自带cell
    section = [XLFormSectionDescriptor formSectionWithTitle:@"XLFormSectionInsertModeButton With Inline Cells"
                                             sectionOptions:XLFormSectionOptionCanInsert
                                          sectionInsertMode:XLFormSectionInsertModeButton];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:nil rowType:XLFormRowDescriptorTypeDateInline];
    row.value = [NSDate new];
    row.title = @"新增picker栏测试";
    section.multivaluedRowTemplate = row;
    
    
    
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"eight" rowType:XLFormRowDescriptorTypeUpload];
    [section addFormRow:row];
    
    
    self.form = form;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    return view;

}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 20;
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 20;
    }
    return CGFLOAT_MIN;
}



// 每个cell内部的参数属性更改了就会调用这个方法，我们再次更新的话就会调用cell里面update的方法进行重绘
- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue
{
    // 咱们这里统一调用更新
    [super formRowDescriptorValueHasChanged:formRow oldValue:oldValue newValue:newValue];
    [self updateFormRow:formRow];
    
    
    // 以下就是一些典型的tag判断，根据不同的cell，remove 或 update进行更改
//    if ([rowDescriptor.tag isEqualToString:@"first"]){
//
//    }
//    else if ([rowDescriptor.tag isEqualToString:@"second"]){
//
//        [self updateFormRow:startDateDescriptor];
//        [self updateFormRow:endDateDescriptor];
//    }
//    else if ([rowDescriptor.tag isEqualToString:@"third"]){
//        
//            [self updateFormRow:endDateDescriptor];
//        
//    }
//    else if ([rowDescriptor.tag isEqualToString:@"这里填写的就是我们注册的ID"]){
//        
//    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50);
    self.tableView.tableHeaderView = self.headView;
    self.footerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, [UIScreen mainScreen].bounds.size.width, 50);
    [self.view addSubview:self.footerView];
}
- (IBAction)clickDone:(id)sender {
    
    NSDictionary *dict = [self formValues];
    NSLog(@"表单中所有的字典值%@",dict);
}


- (void)dealloc
{
    NSLog(@"%s-->dealloc",object_getClassName(self));
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
