#import "GDSearchResults.h"

@implementation GDSearchResults

- (id)initWithResponse:(id) response page:(int) page {
	self = [super init];
	if(self) {
		_page = page;
		_pages = [response objectForKey:@"pages"];
		_results = [GDSearchResult createWithResponse:[response objectForKey:@"data"]];
	}
	return self;
}

- (BOOL)hasResults {
	return [_results count] > 0;
}

@end