
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Common/QLAvailability.h>

#import "QLContextConnectorPermissions.h"

@protocol QLContextCorePermissionsDelegate <NSObject>

@optional
- (void)subscriptionPermissionDidChange:(BOOL)subscriptionPermission;

@end


@interface QLContextCoreConnector : NSObject

@property (nonatomic, unsafe_unretained) id<QLContextCorePermissionsDelegate> permissionsDelegate;

- (void)enableFromViewController:(UIViewController *)viewController
                         success:(void (^)())success
                         failure:(void (^)(NSError *error))failure;

- (void)deleteAllUserDataAndOnSuccess:(void (^)())success
                              failure:(void (^)(NSError *error))failure;

- (void)checkStatusAndOnEnabled:(void (^)(QLContextConnectorPermissions *contextConnectorPermissions))enabled 
                       disabled:(void (^)(NSError *error))disabled;

- (void)showPermissionsFromViewController:(UIViewController *)viewController
                                  success:(void (^)())success
                                  failure:(void (^)(NSError *error))failure;

/*
 *  showPermissionsFromViewController:
 *
 *  Discussion:
 *      Deprecated in v0.43. Use the showPermissionsFromViewController:success:failure: instead.
 */
- (void)showPermissionsFromViewController:(UIViewController *)viewController DEPRECATED;

@end
