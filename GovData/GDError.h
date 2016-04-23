#import <Foundation/Foundation.h>

#import "GDTypes.h"

@interface GDError : NSError

- (id)initWithCode:(const GDErrorEnum) code;
- (id)initWithMessage:(const GDErrorEnum) code message:(const NSString *) message;

+ (const GDError *)createWithCode:(const GDErrorEnum) code;
+ (const GDError *)createWithResponse:(id) response;

@end

typedef void (^GDErrorResponse)(const GDError *);