#import "GDHelpers.h"

@implementation GDHelpers

+ (const NSDate *)createDate:(const NSNumber *) timestamp {
	long value = [timestamp integerValue];
	return [[NSDate alloc] initWithTimeIntervalSince1970: value];
}

+ (const NSDate *)createDateFromMsec:(const NSNumber *) timestamp {
	long value = [timestamp integerValue] / 1000;
	return [[NSDate alloc] initWithTimeIntervalSince1970: value];
}

@end
