//
//  AddEntryViewController.m
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/15/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "AddEntryViewController.h"

@interface AddEntryViewController ()

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setUpViews];
    
    [self setUpToolBar];
}


- (void)setUpViews {
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 50)];
    self.textField.delegate = self;
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.placeholder = @"Entry Title";
    self.textField.font = [UIFont fontWithName:@"Chalkduster" size:16];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 250)];
    self.textView.delegate = self;
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.font = [UIFont fontWithName:@"Chalkduster" size:16];
    
    
}
     
- (void)setUpToolBar {
    
    self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    self.toolBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.toolBar];
         
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
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
