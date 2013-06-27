
#import <Foundation/Foundation.h>

@interface QLPushNotificationsConnector : NSObject

+ (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types;

+ (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

+ (void)unregisterForRemoteNotifications;

+ (void)didReceiveRemoteNotification:(NSDictionary *)userInfo;

+ (void)didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
