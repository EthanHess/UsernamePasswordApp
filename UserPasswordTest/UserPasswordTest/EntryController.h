//
//  EntryController.h
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/15/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text andDate:(NSDate *)date;

- (void)removeEntry:(Entry *)entry;

@end
