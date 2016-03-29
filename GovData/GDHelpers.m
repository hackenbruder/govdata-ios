#import "GDHelpers.h"

@implementation GDHelpers

+ (const NSDate *)createDate:(const NSNumber *) timestamp {
	long value = 0;
	const BOOL isMilliseconds = [timestamp integerValue] > 1000000000000;
	if(isMilliseconds) {
		value = [timestamp integerValue] / 1000;
	} else {
		value = [timestamp integerValue];
	}
	return [[NSDate alloc] initWithTimeIntervalSince1970: value];
}

@end
