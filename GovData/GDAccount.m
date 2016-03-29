#import "GDAccount.h"

@implementation GDAccount

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_number = [response objectForKey:@"account_number"];
		_prefix = [response objectForKey:@"prefix"];
		_bankCode = [response objectForKey:@"bank_code"];
		_publishedAt = [GDHelpers createDateFromMsec: [response objectForKey:@"published_at"]];
	}
	return self;
}

- (BOOL)isLocal {
	return [self hasBankCode];
}

- (BOOL)isIntl {
	return ![self isLocal];
}

- (BOOL)hasPrefix {
	return _prefix != nil && [_prefix length] > 0;
}

- (BOOL)hasBankCode {
	return _bankCode != nil && [_bankCode length] > 0;
}

- (const NSString *)description {
	if([self isIntl]) {
		return _number;
	} else if([self hasPrefix]) {
		return [NSString stringWithFormat: @"%@-%@/%@", _prefix, _number, _bankCode];
	} else {
		return [NSString stringWithFormat: @"%@/%@", _number, _bankCode];
	}
}

+ (const NSArray<const GDAccount *> *)createWithResponse:(id) response {
	NSMutableArray * accounts = [[NSMutableArray alloc] init];
	for(int i = 0; i < [response count]; ++i) {
		id accountResponse = [response objectAtIndex: i];
		const GDAccount * account = [[GDAccount alloc] initWithResponse: accountResponse];
		[accounts addObject: account];
	}
	return [accounts copy];
}

@end