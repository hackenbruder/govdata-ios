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
		@"type": @100,
		@"name": @"testing name",
		@"founded_at": @725677200,
		@"lat": @49.6590646,
		@"lon": @13.819072
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

- (void)test4HasGeoStatus {
	XCTAssertTrue([_standard geoStatus] == GDAddressDataAccurate, "Missing geo data status");
}

- (void)test5HasGeo {
	XCTAssertTrue([_standard hasGeo] && [_standard geo].latitude != 0 && [_standard geo].longitude != 0, "Missing geo");
}

- (void)test6ReturnsType {
	const NSString * s = [_standard type];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing type");
}

- (void)test7ReturnsTypeDescription {
	const NSString * s = [_standard typeDescription];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing type description");
}

@end