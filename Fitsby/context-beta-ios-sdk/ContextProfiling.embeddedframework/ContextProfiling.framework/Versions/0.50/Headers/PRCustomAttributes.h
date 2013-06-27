#import <Foundation/Foundation.h>

@interface PRCustomAttributes : NSObject

@property (nonatomic, strong) NSMutableDictionary *attrs;

-(void)addStringAttribute:(NSString *) value forKey:(NSString *) name;
-(NSString *)getStringAttribute:(NSString *) name;
-(void)removeAttribute:(NSString *) name;

@end
