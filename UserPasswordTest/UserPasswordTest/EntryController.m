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


- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text andDate:(NSDate *)date {
    
    
    
}


- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}

@end
