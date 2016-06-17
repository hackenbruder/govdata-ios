#import "GDSearchResult.h"

@implementation GDSearchResult

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
		if(lat != nil && lon != nil) {
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

+ (const NSArray<const GDSearchResult *> *)createWithResponse:(id) response {
	NSMutableArray * accounts = [[NSMutableArray alloc] init];
	for(int i = 0; i < [response count]; ++i) {
		id searchResponse = [response objectAtIndex: i];
		const GDSearchResult * account = [[GDSearchResult alloc] initWithResponse: searchResponse];
		[accounts addObject: account];
	}
	return [accounts copy];
}

@end