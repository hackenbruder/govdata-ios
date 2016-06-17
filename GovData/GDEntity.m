#import "GDEntity.h"

NSString * const GDEntityTypeTable = @"GDEntityTypes";

@implementation GDEntity

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_registers = [response objectForKey:@"registers"];
		_number = [response objectForKey:@"number"];
		_name = [response objectForKey:@"name"];
		_foundedAt = [GDHelpers createDateFromMsec: [response objectForKey:@"founded_at"]];
		
		NSString * type = [response objectForKey:@"legal_type_id"];
		if(type != nil) {
			_type = @([type intValue]);
		}
		
		id vat = [response objectForKey:@"vat"];
		if(vat != nil && [vat isKindOfClass:[NSDictionary class]] && [self hasVAT]) {
			_vat = [[GDVAT alloc] initWithResponse: vat];
		}
		
		id address = [response objectForKey:@"address"];
		if(address != nil && [address isKindOfClass:[NSDictionary class]]) {
			_address = [[GDAddress alloc] initWithResponse: address];
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

- (const GDAddress *)address:(const GDError **) error {
	if(_address == nil) {
		*error = [GDError createWithCode: GDErrorDataUnavailable];
		return nil;
	}
	return _address;
}

- (const NSString *)typeDescription {
	return [GDHelpers localizedString:[_type stringValue] table:GDEntityTypeTable];
}

- (BOOL)hasVAT {
	return [[_registers objectForKey:@"vat"] boolValue];
}

@end
