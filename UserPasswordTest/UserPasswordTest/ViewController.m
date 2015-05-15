//
//  ViewController.m
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/10/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "EntryListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setUpViews];
    
}

- (void)setUpViews {
    
    self.usernameField = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 80)];
    self.usernameField.delegate = self;
    self.usernameField.placeholder = @"Username";
    self.usernameField.borderStyle = UITextBorderStyleRoundedRect;
    self.usernameField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.usernameField];
    
    self.passwordField = [[UITextField alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 80)];
    self.passwordField.delegate = self;
    self.passwordField.placeholder = @"Password";
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.textAlignment = NSTextAlignmentCenter;
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.passwordField];
    
    self.proceedButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, self.view.frame.size.width - 200, 80)];
    [self.proceedButton setTitle:@"Proceed" forState:UIControlStateNormal];
    [self.proceedButton setBackgroundColor:[UIColor blueColor]];
    [self.proceedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.proceedButton addTarget:self action:@selector(proceed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.proceedButton];

    
}

- (void)proceed {
    
    if ([self.usernameField.text isEqualToString:@""] && [self.passwordField.text isEqualToString:@""]) {
        
        [self alertViewOne];
    }
    
    else {
        
    EntryListViewController *entryListVC = [EntryListViewController new];
    
    [self.navigationController pushViewController:entryListVC animated:YES];
        
    }
    
}

- (void)alertViewOne {
    
    UIAlertView *alertViewOne = [[UIAlertView alloc]initWithTitle:@"Please enter a valid Username and Password" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alertViewOne show];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
