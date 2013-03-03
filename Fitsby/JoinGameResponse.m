//
//  JoinGameResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "JoinGameResponse.h"

@implementation JoinGameResponse

-(id) init {
    self = [super init];
    if (!self)
        return nil;
    
    //TODO add additional implementation
    return self;
}

-(id) initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super initWithDictionary:jsonDictionary];
    if (!self)
        return nil;
    
    //TODO parse dictionary
    return self;
}
@end
