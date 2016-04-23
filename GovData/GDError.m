#import "GDError.h"

NSString * const GDErrorDomain = @"cz.govdata.GovData";
NSString * const GDStringsTable = @"GovData";

@implementation GDError

- (id)initWithCode:(const GDErrorEnum) code {
	NSString * key = [NSString stringWithFormat:@"%ld", (long)code];
	NSString * description = NSLocalizedStringFromTable(key, GDStringsTable, nil);
	NSDictionary * userInfo = @{NSLocalizedDescriptionKey: description};
	
	self = [super initWithDomain: GDErrorDomain code: code userInfo: userInfo];
	return self;
}

- (id)initWithMessage:(const GDErrorEnum) code message:(const NSString *) message {
	NSString * key = [NSString stringWithFormat:@"%ld", (long)code];
	NSString * description = NSLocalizedStringFromTable(key, GDStringsTable, nil);
	NSDictionary * userInfo;
	if(description) {
		userInfo = @{NSLocalizedDescriptionKey: description};
	} else {
		userInfo = @{NSLocalizedDescriptionKey: message};
	}
	
	self = [super initWithDomain: GDErrorDomain code: code userInfo: userInfo];
	return self;
}

+ (const GDError *)createWithCode:(const GDErrorEnum) code {
	return [[self alloc] initWithCode: code];
}

+ (const GDError *)createWithResponse:(id) response {
	NSString * code = [response valueForKey:@"code"];
	NSString * message = [response valueForKey:@"message"];
	return [[self alloc] initWithMessage: [code intValue] message: message];
}

@end
