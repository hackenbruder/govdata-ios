#import "GDVAT.h"

@implementation GDVAT

@synthesize number = _number;

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_number = [response objectForKey:@"dic"];
		_unreliable = [[response objectForKey:@"unreliable"] boolValue];
		_accounts = [GDAccount createWithResponse: [response objectForKey:@"accounts"]];
		_updatedAt = [GDHelpers createDateFromMsec: [response objectForKey:@"updated_at"]];
	}
	return self;
}

- (const NSString *)number {
	return [NSString stringWithFormat:@"CZ%@", _number];
}

- (BOOL)hasAccounts {
	return [_accounts count] > 0;
}

- (BOOL)isUnreliable {
	return _unreliable;
}

- (const NSString *)description {
	return [self number];
}

@end