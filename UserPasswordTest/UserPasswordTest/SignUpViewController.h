//
//  SignUpViewController.h
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/12/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserController.h"
#import "User.h"

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) User *user;

@end
