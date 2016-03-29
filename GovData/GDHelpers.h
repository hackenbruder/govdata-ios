#import <Foundation/Foundation.h>

@interface GDHelpers : NSObject

+ (const NSDate *)createDate:(const NSNumber *) timestamp;
+ (const NSDate *)createDateFromMsec:(const NSNumber *) timestamp;

@end
