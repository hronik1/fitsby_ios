//
//  FeedCell.h
//  Fitsby
//
//  Created by Anirudh Balagopal on 29/06/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedCell : NSObject
@property(strong,nonatomic) NSString* firstName;
@property(strong,nonatomic) NSString* lastName;
@property(strong,nonatomic) NSString* message;
@property(strong,nonatomic) NSString* timeStamp;
@property(strong,nonatomic) NSString* commentType;
@property NSInteger* userId;
-(id)initWithData:(NSString*)aFirstName
           lastName:(NSString*)aLastName
            message:(NSString*)aMessage
          timeStamp:(NSString*)aTimeStamp
        commentType:(NSString*)aCommentType
             userId:(NSInteger*)aUserId;





@end
