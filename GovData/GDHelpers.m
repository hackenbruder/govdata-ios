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
	NSBundle * mainBundle = [NSBundle bundleForClass:[self class]];
	NSString * bundlePath = [mainBundle pathForResource:@"GovData" ofType:@"bundle"];
	NSBundle * bundle = [NSBundle bundleWithPath:bundlePath];
	if(bundle == nil) {
		return NSLocalizedStringFromTableInBundle(key, table, mainBundle, nil);
	}
	return NSLocalizedStringFromTableInBundle(key, table, bundle, nil);
}

@end
