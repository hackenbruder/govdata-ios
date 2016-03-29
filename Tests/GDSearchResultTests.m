#import <XCTest/XCTest.h>
#import "GDSearchResult.h"

@interface GDSearchResultTests : XCTestCase
@property (nonatomic, strong) const GDSearchResult * standard;
@end

@implementation GDSearchResultTests

- (void)setUp {
	[super setUp];
	
	const NSDictionary * standard =
	@{
		@"number": @"123",
		@"name": @"testing name",
		@"founded_at": @725677200
	};
	_standard = [[GDSearchResult alloc] initWithResponse: standard];
}

- (void)test1ReturnsNumber {
	const NSString * s = [_standard number];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing number");
}

- (void)test2ReturnsName {
	const NSString * s = [_standard name];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing name");
}

- (void)test3ReturnsFoundedAt {
	const NSDate * s = [_standard foundedAt];
	XCTAssertTrue([s isKindOfClass: [NSDate class]], "Missing foundation date");
}

@end