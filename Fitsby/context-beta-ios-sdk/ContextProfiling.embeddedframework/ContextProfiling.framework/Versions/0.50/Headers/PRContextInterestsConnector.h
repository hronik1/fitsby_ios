#import <Foundation/Foundation.h>

@class PRProfile;
@class PRCustomAttributes;

@protocol PRContextInterestsDelegate <NSObject>

@optional

- (void)interestsDidChange:(PRProfile *)profile;
- (void)interestsPermissionDidChange:(BOOL)interestsPermission;

@end


@interface PRContextInterestsConnector : NSObject

@property (assign) id<PRContextInterestsDelegate> delegate;

@property (nonatomic, readonly) PRProfile *interests;
@property (nonatomic, readonly) BOOL isInterestsEnabled;

@property (nonatomic, strong) PRCustomAttributes *customAttributes;

@end
