//
//  EntryController.m
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/15/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)entries {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return objects;
    
}

- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text andDate:(NSDate *)date {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.title = title;
    entry.text = text;
    entry.date = date;
    
    [self synchronize];
    
}

- (void)removeEntry:(Entry *)entry {
    
    [entry.managedObjectContext deleteObject:entry]; 
    
    [self synchronize];
    
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}

@end
