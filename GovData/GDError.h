#import <Foundation/Foundation.h>

#import "GDTypes.h"

@interface GDError : NSError

- (id)initWithCode:(const ErrorEnum) code;
- (id)initWithMessage:(const ErrorEnum) code message:(const NSString *) message;

+ (const GDError *)createWithCode:(const ErrorEnum) code;
+ (const GDError *)createWithResponse:(id) response;

@end

typedef void (^GDErrorResponse)(const GDError *);