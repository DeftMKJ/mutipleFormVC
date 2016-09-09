//
//  ViewController.m
//  MKJForm
//
//  Created by MKJING on 16/9/6.
//  Copyright © 2016年 MKJING. All rights reserved.
//

#import "ViewController.h"
#import "MKJFormViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touch:(id)sender {
    
    MKJFormViewController *form = [[MKJFormViewController alloc] init];
    [self.navigationController pushViewController:form animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
