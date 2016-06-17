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

+ (const NSString *)localizedString:(NSString *) key table:(NSString *) table {
	NSString * path = [[NSBundle mainBundle] pathForResource:@"GovData" ofType:@"bundle"];
	NSBundle * bundle = [NSBundle bundleWithPath:path];
	if(bundle == nil) {
		return key;
	}
	return NSLocalizedStringFromTableInBundle(key, table, bundle, nil);
}

@end
