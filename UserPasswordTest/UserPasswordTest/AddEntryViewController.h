//
//  AddEntryViewController.h
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/15/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEntryViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) UIButton *clearButton; 

@end
