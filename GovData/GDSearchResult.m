#import "GDSearchResult.h"

@implementation GDSearchResult

- (id)initWithResponse:(id) response {
	self = [super init];
	if(self) {
		_number = [response objectForKey:@"number"];
		_name = [response objectForKey:@"name"];
		_foundedAt = [GDHelpers createDate: [response objectForKey:@"founded_at"]];
	}
	return self;
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