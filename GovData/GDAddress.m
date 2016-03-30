#import "GDAddress.h"

@implementation GDAddress

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		const NSNumber * status = [response objectForKey:@"status"];
		if(status != nil) {
			_status = [status integerValue];
		} else {
			_status = GDAddressMissingData;
		}
		
		id geo = [response objectForKey:@"geo"];
		if(geo != nil) {
			const NSNumber * status = [geo objectForKey:@"status"];
			if(status != nil) {
				_geoStatus = [status integerValue];
			} else {
				_geoStatus = GDAddressDataUnavailable;
			}
			
			id coords = [geo objectForKey:@"coords"];
			if(_geoStatus != GDAddressDataUnavailable && coords != nil && [coords count] == 2) {
				const NSNumber * lat = [coords objectAtIndex:0];
				const NSNumber * lon = [coords objectAtIndex:1];
				_geo = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
			}
		} else {
			_geoStatus = GDAddressDataUnavailable;
		}
		
		id ruian = [response objectForKey:@"ruian"];
		if(ruian != nil) {
			const NSNumber * status = [ruian objectForKey:@"status"];
			if(status != nil) {
				_ruianStatus = [status integerValue];
			} else {
				_ruianStatus = GDAddressDataUnavailable;
			}
			
			if(_ruianStatus != GDAddressDataUnavailable) {
				_ruian = [[GDRUIAN alloc] initWithResponse: [ruian objectForKey:@"data"]];
				_formatted = [ruian objectForKey:@"formatted"];
			}
		} else {
			_ruianStatus = GDAddressDataUnavailable;
		}
	}
	return self;
}

- (BOOL)hasGeo {
	return _geoStatus != GDAddressDataUnavailable;
}

- (BOOL)hasRUIAN {
	return _ruian != nil && _ruianStatus != GDAddressDataUnavailable;
}

- (const NSArray<const NSString *> *)formatted:(const GDError **) error {
	if([self hasRUIAN]) {
		return _formatted;
	} else {
		*error = [GDError createWithCode: GDErrorDataUnavailable];
		return nil;
	}
}

- (const NSString *)description {
	if([self hasRUIAN]) {
		return [_formatted componentsJoinedByString:@"\n"];
	}
	return nil;
}

@end