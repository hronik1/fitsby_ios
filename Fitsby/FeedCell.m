//
//  FeedCell.m
//  Fitsby
//
//  Created by Anirudh Balagopal on 29/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "FeedCell.h"

@implementation FeedCell

-(id)initWithData:(NSString *)aFirstName
           lastName:(NSString *)aLastName
            message:(NSString *)aMessage
          timeStamp:(NSString *)aTimeStamp
        commentType:(NSString *)aCommentType
             userId:(NSInteger *)aUserId
{
    self =[super init];
    if(self)
    {
        self.firstName=aFirstName;
        self.lastName=aLastName;
        self.message=aMessage;
        self.timeStamp=aTimeStamp;
        self.commentType=aCommentType;
        self.userId=aUserId;
    }
    return self;
}
@end
