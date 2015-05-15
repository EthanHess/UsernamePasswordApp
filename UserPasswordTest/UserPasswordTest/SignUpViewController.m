//
//  SignUpViewController.m
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/12/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController () <UIAlertViewDelegate>

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
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
    
    self.saveButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, self.view.frame.size.width - 200, 80)];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton setBackgroundColor:[UIColor redColor]];
    [self.saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveButton];
    
    
}


- (void)save {
    
    if ([self.usernameField.text isEqualToString:@""] && [self.passwordField.text isEqualToString:@""]) {
        
        [self alertViewOne];
    }
    
    else {
        
        [[UserController sharedInstance] addUsername:self.usernameField.text andPassword:self.passwordField.text toUser:self.user];
        
        self.user.username = self.usernameField.text;
        self.user.password = self.passwordField.text;
        
        [self alertViewTwo];
    }
    
}

- (void)alertViewOne {
    
    UIAlertView *alertViewOne = [[UIAlertView alloc]initWithTitle:@"Username and Password can't be blank" message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alertViewOne show];
    
}

- (void)alertViewTwo {
    
    UIAlertView *alertViewTwo = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Your username is %@ and your password is %@",self.user.username, self.user.password] message:nil delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alertViewTwo show];
    
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
