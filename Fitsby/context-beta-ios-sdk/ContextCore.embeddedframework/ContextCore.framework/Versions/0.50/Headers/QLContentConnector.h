
#import <Foundation/Foundation.h>
#import "QLPushNotificationsConnector.h"

@class QLContentNotification;
@class QLContent;

typedef enum  {
    QLNotificationAppWasInForeground = 10,
    QLNotificationAppWasInBackground = 20,
    QLNotificationAppWasLaunched = 30
} QLNotificationAppState;


@protocol QLTimeContentDelegate <NSObject>

- (void)didReceiveNotification:(QLContentNotification *)notification
                      appState:(QLNotificationAppState)appState;

@end

@interface QLContentConnector : NSObject

@property (nonatomic, unsafe_unretained) id<QLTimeContentDelegate> delegate;

- (void)contentWithId:(NSString *)identifier
              success:(void (^)(QLContent *content))success
              failure:(void (^)(NSError *error))failure;

- (void)timeContentsFromStartDate:(NSDate *)startDate
                        toEndDate:(NSDate *)endDate
                          success:(void (^)(NSArray *timeContents))success
                          failure:(void (^)(NSError *error))failure;
@end
