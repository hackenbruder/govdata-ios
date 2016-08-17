#import "GDSearchResultAddress.h"

@implementation GDSearchResultAddress

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_addressId = [response objectForKey:@"address_id"];
		_text = [response objectForKey:@"text"];
		_updatedAt = [GDHelpers createDate: [response objectForKey:@"updated_at"]];
		
		const NSNumber * lat = [response objectForKey:@"lat"];
		const NSNumber * lon = [response objectForKey:@"lon"];
		if(lat != NULL && lon != NULL) {
			_geoStatus = GDAddressDataAccurate;
			_geo = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
		} else {
			_geoStatus = GDAddressDataUnavailable;
		}
	}
	return self;
}

- (BOOL)hasGeo {
	return _geoStatus != GDAddressDataUnavailable;
}

+ (const NSArray<const GDSearchResultAddress *> *)createWithResponse:(id) response {
	NSMutableArray * addresses = [[NSMutableArray alloc] init];
	for(int i = 0; i < [response count]; ++i) {
		id searchResponse = [response objectAtIndex: i];
		const GDSearchResultAddress * address = [[GDSearchResultAddress alloc] initWithResponse:searchResponse];
		[addresses addObject:address];
	}
	return [addresses copy];
}

@end