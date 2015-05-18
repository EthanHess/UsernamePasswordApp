//
//  AddEntryViewController.m
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/15/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "AddEntryViewController.h"
#import "EntryListViewController.h"
#import "EntryController.h"

@interface AddEntryViewController ()

@property (nonatomic, strong) NSDate *timestamp;

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.navigationBarHidden = YES;
    
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
    [self.view addSubview:self.textView];
    
    self.timestamp = [NSDate date];
    
    
}
     
- (void)setUpToolBar {
    
    self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    self.toolBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.toolBar];
    
    NSMutableArray *navItems = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *save = [UIImage imageNamed:@"save"];
    UIImage *arrow = [UIImage imageNamed:@"leftArrow"];
    
    UIBarButtonItem *flexItem0 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [navItems addObject:flexItem0];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithImage:save style:UIBarButtonItemStylePlain target:self action:@selector(saveEntry)];
    [navItems addObject:saveButton];
    
    UIBarButtonItem *flexItem1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [navItems addObject:flexItem1];
    
    UIBarButtonItem *arrowButton = [[UIBarButtonItem alloc]initWithImage:arrow style:UIBarButtonItemStylePlain target:self action:@selector(entryList)];
    [navItems addObject:arrowButton];
                                    
    UIBarButtonItem *flexItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [navItems addObject:flexItem2];
    
    [self.toolBar setItems:navItems];
         
}

- (void)saveEntry {
    
    [[EntryController sharedInstance]addEntryWithTitle:self.textField.text text:self.textView.text andDate:self.timestamp];
    
}

- (void)entryList {
    
    EntryListViewController *entryList = [EntryListViewController new];
    [self.navigationController pushViewController:entryList animated:YES];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    [textView resignFirstResponder];
    
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
