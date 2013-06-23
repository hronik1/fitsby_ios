#import <Foundation/Foundation.h>

@class PRProfileAttribute;
@class PRCustomAttributes;

@interface PRProfile : NSObject

@property (nonatomic, strong) NSDate *creationTime;
@property (nonatomic, strong) NSDictionary *attrs;
@property (nonatomic, strong) PRCustomAttributes *customAttrs;

-(PRProfileAttribute *)getAttribute:(NSString *)key;
-(void)addAttribute:(PRProfileAttribute *) attribute;

-(void)setCustomAttributes:(PRCustomAttributes *)attrs;
-(PRCustomAttributes *)getCustomAttributes;

@end
