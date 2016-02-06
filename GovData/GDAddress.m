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
			if (status != nil) {
				_geoStatus = [status integerValue];
			} else {
				_geoStatus = GDAddressDataUnavailable;
			}
			
			id coords = [geo objectForKey:@"coords"];
			if(_geoStatus != GDAddressDataUnavailable && coords != nil && [coords count] == 2) {
				const NSNumber * lat = [coords objectAtIndex:0];
				const NSNumber * lon = [coords objectAtIndex:1];
				_geoCoords = [[CLLocation alloc] initWithLatitude: [lat doubleValue] longitude: [lon doubleValue]];
			}
		}
		
		//ruian
	}
	return self;
}

@end