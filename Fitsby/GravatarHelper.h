//
//  GravatarHelper.h
//  Fitsby
//
//  Created by Brent Hronk on 3/4/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GravatarHelper : NSObject

/**
 *  getGravatarURL
 *
 *  Converts an email address to the corresponding url of their gravatar.
 *
 *  @param  emailAddress  The email address to be converted.
 *
 *  @return  The URL corresponding to the gravatar.
 */
+(NSURL*) getGravatarURL:(NSString *)emailAddress;

/**
 *  md5
 *
 *  Generates an md5 hashing of the input string.
 *
 *  @param  unhashedString  String which is to be hashed.
 *
 *  @return  The md5-hashed string representation of unhashedString.
 */
+(NSString *) md5:(NSString *)unhashedString;

/**
 *  formQueryString
 *
 *  Generates a formatted gravatar query string from the formatted email.
 *
 *  @param  formattedEmail  Formatted email address for the user whos query will be formed.
 *
 *  @return  A well formatted query string for the target email.
 */
+(NSString *) formQueryString:(NSString *)formattedEmail;
@end
