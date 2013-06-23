
#import <Foundation/Foundation.h>

@interface QLContent : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *contentDescription;
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic, strong) NSString *campaignId;
@property (nonatomic, strong) NSDate *expires;

@end
