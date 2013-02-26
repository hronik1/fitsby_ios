//
//  UserCommunication.h
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCommunication : NSObject

+ (NSData *) loginUser:(NSString *)email withPassword:(NSString *)password;

@end
