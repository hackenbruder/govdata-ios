#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ErrorEnum) {
	GDErrorGeneric					= 100, //@"api request error"
	GDErrorThrottled				= 105, //@"api request was throttled"
	GDErrorNotFound					= 110, //@"requested content was not found"
	GDErrorInvalidRequest		= 115, //@"invalid request"
	GDErrorDataUnavailable	= 120  //@"data unavailable or missing"
};

@interface GDError : NSError

- (id)initWithCode:(const ErrorEnum) code;
- (id)initWithMessage:(const ErrorEnum) code message:(const NSString *) message;

+ (const GDError *)createWithCode:(const ErrorEnum) code;
+ (const GDError *)createWithResponse:(id) response;

@end

typedef void (^GDErrorResponse)(const GDError *);