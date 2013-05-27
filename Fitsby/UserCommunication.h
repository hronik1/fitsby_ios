//
//  UserCommunication.h
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserResponse;

@interface UserCommunication : NSObject

/**
 *  loginUser:withPassword:confirmPassword:firstName:lastName
 *
 *  Sends a request to attempt to login the User with the input credentials
 *
 * @param  email      Email of user who is attempting to login
 * @param  password   Password of user who is attempting to login 
 *
 * @ereturn  UserResponse corresponding to the parsed request.
 */
+ (UserResponse *)loginUser:(NSString *)email withPassword:(NSString *)password;

/**
 *  registerUser:withPassword:confirmPassword:firstName:lastName
 *
 *  Attempts to register a new User with the following credentials
 *
 * @param  email            Email of user who is attempting to register
 * @param  password         Password of user who is attempting to register
 * @param  confirmPassword  Confirmation of password for attempted registration
 * @param  firstName        First name of user who is attempting to register
 * @param  lastName         Last name of user who is attempting to register
 *
 * @ereturn  UserResponse corresponding to the parsed request.
 */
+ (UserResponse *)registerUser:(NSString *)email withPassword:(NSString *)password
          confirmPassword:(NSString *)confirmPassword firstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
