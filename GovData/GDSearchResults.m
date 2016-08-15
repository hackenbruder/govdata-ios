#import "GDSearchResults.h"

@implementation GDSearchResults

- (id)initWithResponse:(id) response page:(int) page {
	self = [super init];
	if(self) {
		const NSNumber * type = [response objectForKey:@"type"];
		if(type != nil) {
			_type = [type integerValue];
		} else {
			_type = GDSearchResultsInvalid;
		}
		
		id data = [response objectForKey:@"data"];
		if(_type == GDSearchResultsEntities) {
			_results = [GDSearchResultEntity createWithResponse:data];
		} else if(_type == GDSearchResultsAddresses) {
			_results = [GDSearchResultAddress createWithResponse:data];
		}
		
		_page = page;
		_total = [response objectForKey:@"total"];
		_pages = [response objectForKey:@"pages"];
	}
	return self;
}

- (BOOL)hasResults {
	return [_results count] > 0;
}

@end