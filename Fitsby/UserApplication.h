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

@property (strong, atomic) User *user;
@end
