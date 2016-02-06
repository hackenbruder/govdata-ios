#import "GDAddress.h"

@implementation GDAddress

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_status = [response objectForKey:@"status"];
		
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
				NSNumber * lat = [coords objectAtIndex:0];
				NSNumber * lon = [coords objectAtIndex:1];
				_geoCoords = [[CLLocation alloc] initWithLatitude: [lat doubleValue] longitude: [lon doubleValue]];
			}
		}
		
		//ruian
	}
	return self;
}

@end