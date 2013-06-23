#import <Foundation/Foundation.h>
#import "QLJsonSerializable.h"

@interface QLJson : NSObject {
    
}

+(id) create:(Class) type withJson:(NSString *)json error:(NSError **) error;
+(id) create:(Class) type withAttributes:(id) attributes error:(NSError **) error;
+(id) attributesFromJson:(NSString *) json error:(NSError **) error;
+(NSArray *) arrayOf:(Class) type fromArrayOfAttributes:(NSArray *) array error:(NSError **) error;
+(NSDictionary *) dictOf:(Class) type fromDictOfAttributes:(NSDictionary *) dict error:(NSError **) error;
+(NSMutableDictionary *) mutableDictOf:(Class) type fromDictOfAttributes:(NSDictionary *) dict error:(NSError **) error;
+(NSNumber *) numberValue:(id) value  error:(NSError **) error;
+(NSString *) stringValue:(id) value  error:(NSError **) error;
+(double) doubleValue:(id) value error:(NSError **) error;
+(int) intValue:(id) value error:(NSError **) error;
+(NSDate *) dateValue:(id) millis error:(NSError **) error;
+(BOOL) boolValue:(id) value error:(NSError **) error;
+(BOOL) boolValue:(id) value default:(BOOL) def error:(NSError **) error;

+(NSString *)json:(id <QLJsonSerializable>) obj error:(NSError **) error;
+(void)dict:(NSMutableDictionary *)dict setObject:(id)obj forKey:(NSString *)key;
+(NSArray *) arrayOfAttributesFrom:(NSArray *) array;
+(NSArray *) dictOfAttributesFrom:(NSDictionary *) array;
+(NSNumber *) numberDouble:(double) value;
+(NSNumber *) numberInt:(int) value;
+(NSNumber *) dateMillis:(NSDate *) date;
+(NSNumber *) numberBool:(BOOL) value;

+(id) nullToNil:(NSObject *) obj;
+(NSString *) prettyJson:(id <QLJsonSerializable>) obj;

@end
