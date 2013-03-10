//
//  Game.h
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property int _id;
@property BOOL isPrivate;
@property int players;
@property int wager;
@property int stakes;
@property int goal;
@property int duration;
@property (strong, nonatomic) NSString *creatorEmail;
@property (strong, nonatomic) UIImage *creatorImage;

@end
