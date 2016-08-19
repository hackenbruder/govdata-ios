#import "GDSearchResultEntity.h"

@implementation GDSearchResultEntity

extern NSString * const GDEntityTypeTable;

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_number = [response objectForKey:@"number"];
		_name = [response objectForKey:@"name"];
		_type = [response objectForKey:@"type"];
		_foundedAt = [GDHelpers createDate: [response objectForKey:@"founded_at"]];
		
		const NSNumber * lat = [response objectForKey:@"lat"];
		const NSNumber * lon = [response objectForKey:@"lon"];
		if(lat != nil && lat != (const NSNumber *)[NSNull null] && lon != nil && lon != (const NSNumber *)[NSNull null]) {
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

- (const NSString *)typeDescription {
	return [GDHelpers localizedString:[_type stringValue] table:GDEntityTypeTable];
}

+ (const NSArray<const GDSearchResultEntity *> *)createWithResponse:(id) response {
	NSMutableArray * entities = [[NSMutableArray alloc] init];
	for(int i = 0; i < [response count]; ++i) {
		id searchResponse = [response objectAtIndex: i];
		const GDSearchResultEntity * entity = [[GDSearchResultEntity alloc] initWithResponse:searchResponse];
		[entities addObject:entity];
	}
	return [entities copy];
}

@end