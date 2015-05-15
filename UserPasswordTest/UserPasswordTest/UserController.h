//
//  UserController.h
//  UserPasswordTest
//
//  Created by Ethan Hess on 5/12/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserController : NSObject

@property (nonatomic, strong, readonly) NSArray *users;
@property (nonatomic, strong) User *user;

+ (UserController *)sharedInstance;

- (void)addUsername:(NSString *)username andPassword:(NSString *)password toUser:(User *)user; 

@end
