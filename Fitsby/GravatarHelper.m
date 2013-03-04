//
//  GravatarHelper.m
//  Fitsby
//
//  Created by Brent Hronk on 3/4/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "GravatarHelper.h"
#import "CommonCrypto/CommonDigest.h"

//Gravatar site related constants
static NSString *const GRAVATAR_BASE_URL = @"http://www.gravatar.com/avatar/";
static NSString *const DEFAULT_RATING = @"pg";
static NSString *const DEFAULT_IMAGE = @"mm";
static int DEFAULT_SIZE = 120;
static NSString *const SIZE_PARAM = @"size";
static NSString *const RATING_PARAM = @"rating";
static NSString *const IMAGE_PARAM = @"d";

@implementation GravatarHelper

+(NSURL*) getGravatarURL:(NSString *)emailAddress {
    
    NSString *curatedEmail = [[emailAddress stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]] lowercaseString];
    NSString *hashedEmail = [GravatarHelper md5:curatedEmail];
    NSString *formattedQuery = [GravatarHelper formQueryString:hashedEmail];
    
    return [NSURL URLWithString:formattedQuery];
}

+(NSString *) md5:(NSString *)unhashedString {
    
    const char *cStr = [unhashedString UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *hashedString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hashedString appendFormat:@"%02x", digest[i]];
    
    return  hashedString;
    
}

+(NSString *) formQueryString:(NSString *)formattedEmail {
    
    NSMutableString *stringUrl = [GRAVATAR_BASE_URL mutableCopy];
    [stringUrl appendString:formattedEmail];
    [stringUrl appendFormat:@"?%@=%d", SIZE_PARAM, DEFAULT_SIZE];
    [stringUrl appendFormat:@"&%@=%@", RATING_PARAM, DEFAULT_RATING];
    [stringUrl appendFormat:@"&%@=%@", IMAGE_PARAM, DEFAULT_IMAGE];
    
    return stringUrl;
}
@end
