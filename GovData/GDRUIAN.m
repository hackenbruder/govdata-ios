#import "GDRUIAN.h"

@implementation GDRUIAN

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_addressId = [response objectForKey:@"address_id"];
		_city = [response objectForKey:@"city"];
		_cityArea1 = [response objectForKey:@"city_area1"];
		_cityArea2 = [response objectForKey:@"city_area2"];
		_district = [response objectForKey:@"district"];
		_street = [response objectForKey:@"street"];
		_number1 = [response objectForKey:@"number1"];
		_number2 = [response objectForKey:@"number2"];
		_number2Character = [response objectForKey:@"number2_character"];
		_numberType = [response objectForKey:@"number_type"];
		_postalCode = [response objectForKey:@"postal_code"];
		_updatedAt = [GDHelpers createDate: [response objectForKey:@"updated_at"]];
	}
	return self;
}

- (BOOL)isPrague {
	return _cityArea2 != nil && [_cityArea2 length] > 0;
}

- (BOOL)isCityDistrict {
	return [self hasCity] && [self hasDistrict] && [_city isEqualToString:(NSString *)_district];
}

- (BOOL)hasCity {
	return _city != nil && [_city length] > 0;
}

- (BOOL)hasDistrict {
	return _district != nil && [_district length] > 0;
}

- (BOOL)hasStreet {
	return _street != nil && [_street length] > 0;
}

- (BOOL)hasNumber {
	const BOOL n1 = _number1 != nil && _number1 > 0;
	const BOOL n2 = _number2 != nil && _number2 > 0;
	const BOOL c = _number2Character != nil && [_number2Character length] > 0;
	return n1 || n2 || c;
}

- (const NSString *)number:(const GDError **) error {
	const NSString * value;
	if([_number2Character length] > 0) {
		value = [NSString stringWithFormat: @"%@/%@%@", [_number1 stringValue], [_number2 stringValue], [_number2Character uppercaseString]];
	} else if(_number2 != nil) {
		value = [NSString stringWithFormat: @"%@/%@", [_number1 stringValue], [_number2 stringValue]];
	} else if(_number1 != nil) {
		value = [_number1 stringValue];
	} else {
		*error = [GDError createWithCode: GDErrorDataUnavailable];
		return nil;
	}
	
	if([_numberType length] > 4 || (![self hasStreet] && [self isCityDistrict])) {
		value = [NSString stringWithFormat: @"%@ %@", _numberType, value];
	}
	return value;
}

@end