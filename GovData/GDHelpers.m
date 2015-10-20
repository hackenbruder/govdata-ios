#import "GDHelpers.h"

@implementation GDHelpers

+ (const NSDate *)createDate:(const NSNumber *) timestamp {
	return [[NSDate alloc] initWithTimeIntervalSince1970: [timestamp integerValue] / 1000];
}

@end
