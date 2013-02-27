//
//  UserCommunication.h
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCommunication : NSObject

/**
 *  loginUser
 *
 * @param  email      Email of user who is attempting to login
 * @param  password   Password of user who is attempting to login 
 *
 * @ereturn  Raw data returned from the server
 */
+ (NSData *) loginUser:(NSString *)email withPassword:(NSString *)password;

/**
 *  registerUser
 *
 * @param  email            Email of user who is attempting to register
 * @param  password         Password of user who is attempting to register
 * @param  confirmPassword  Confirmation of password for attempted registration
 * @param  firstName        First name of user who is attempting to register
 * @param  lastName         Last name of user who is attempting to register
 *
 * @ereturn  Raw data returned from the server
 */
+ (NSData *) registerUser:(NSString *)email withPassword:(NSString *)password
          confirmPassword:(NSString *)confirmPassword firstName:(NSString *)firstName lastName:(NSString *)lastName;
@end
