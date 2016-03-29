#import <XCTest/XCTest.h>
#import "GDSearchResults.h"

@interface GDSearchResultsTests : XCTestCase
@property (nonatomic, strong) const GDSearchResults * standard;
@end

@implementation GDSearchResultsTests

- (void)setUp {
	[super setUp];
	
	const NSDictionary * standard =
	@{
		@"pages": @1,
		@"data": @[
			@{
				@"number": @"123",
				@"name": @"testing name",
				@"founded_at": @725677200
			},
			@{
				@"number": @"123",
				@"name": @"testing name",
				@"founded_at": @725677200
			},
		]
	};
	_standard = [[GDSearchResults alloc] initWithResponse: standard];
}

- (void)test1ReturnsPages {
	const NSNumber * n = [_standard pages];
	XCTAssertTrue([n isKindOfClass: [NSNumber class]] && n > 0, "Missing page count");
}

- (void)test2HasResults {
	BOOL t1 = [_standard hasResults];
	XCTAssertTrue(t1, "Invalid results report");
}

@end