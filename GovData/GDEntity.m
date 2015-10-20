#import "GDEntity.h"

@implementation GDEntity

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_registers = [response objectForKey:@"registers"];
		_number = [response objectForKey:@"number"];
		_name = [response objectForKey:@"name"];
		_foundedAt = [GDHelpers createDate: [response objectForKey:@"founded_at"]];
		
		id vat = [response objectForKey:@"vat"];
		if(vat != nil && [vat isKindOfClass:[NSDictionary class]] && [self hasVAT]) {
			_vat = [[GDVAT alloc] initWithResponse: vat];
		}
	}
	return self;
}

- (const GDVAT *)vat:(const GDError **) error {
	if([self hasVAT] && _vat == nil) {
		*error = [GDError createWithCode: GDErrorDataUnavailable];
		return nil;
	}
	return _vat;
}

- (BOOL)hasVAT {
	return [[_registers objectForKey:@"vat"] boolValue];
}

@end
