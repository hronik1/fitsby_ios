#import <Foundation/Foundation.h>

@class PRProfile;

@interface PRProfileEngine : NSObject

@property (nonatomic, readonly) NSString *rulesFile;
@property (nonatomic, readonly) PRProfile *profile;

@end
