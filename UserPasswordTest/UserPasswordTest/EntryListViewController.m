//
//  EntryListViewController.m
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/15/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntryListViewController.h"
#import "AddEntryViewController.h"
#import "EntryController.h"
#import "Entry.h"


@interface EntryListViewController ()

@end

@implementation EntryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.navigationBarHidden = YES;
    
    [self setUpToolBar];
    [self setUpTableView];

    
}

- (void)setUpToolBar {
    
    self.toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    [self.toolbar setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.toolbar];
    
    NSMutableArray *navItems = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIImage *plus = [UIImage imageNamed:@"plus"];
    
    UIBarButtonItem *flexItem0 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [navItems addObject:flexItem0];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithImage:plus style:UIBarButtonItemStylePlain target:self action:@selector(addEntry)];
    [navItems addObject:add];
    
    UIBarButtonItem *flexItem1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [navItems addObject:flexItem1];
    
    [self.toolbar setItems:navItems];
    
}

- (void)setUpTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (void)addEntry {
    
    AddEntryViewController *addEntryVC = [AddEntryViewController new];
    
    [self.navigationController pushViewController:addEntryVC animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [EntryController sharedInstance].entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", entry.date];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AddEntryViewController *addEntryVC = [AddEntryViewController new];
    
    [self.navigationController pushViewController:addEntryVC animated:YES];
    
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
