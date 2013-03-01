//
//  User.h
//  Fitsby
//
//  Created by Brent Hronk on 2/26/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property int _id;
@property (weak, nonatomic) NSString *firstName;
@property (weak, nonatomic) NSString *lastName;
@property (weak, nonatomic) NSString *email;

/** 
 * init
 *
 * Default initialize method for User
 *
 * @return  This instance of a User
 */
-(id)init;

/**
 * initWithId:firstName:lastName:email
 *
 * Initializes the User object with the given paramaters
 *
 * @param  _id        User's Id
 * @param  firstName  User's first name
 * @param  lastName   User's last name
 * @param  email      User's email
 *
 * @return  This instance of a User
 */
-(id)initWithId:(int)_id firstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email;

@end
