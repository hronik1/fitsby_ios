//
//  UserApplication.h
//  Fitsby
//
//  Created by Brent Hronk on 2/26/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class User;

@interface UserApplication : UIApplication
{
    NSNumber *gameID;
    NSArray *feedArray;
}

@property (strong, atomic) User *user;
@property NSString *gameID;
@property NSArray *feedArray;

@end
