#import <XCTest/XCTest.h>
#import "GDAddress.h"

@interface GDAddressTests : XCTestCase
@property (nonatomic, strong) const GDAddress * standard;
@end

@implementation GDAddressTests

- (void)setUp {
	[super setUp];
	
	//mock data
	const NSDictionary * geoAccurate =
	@{
		@"status": @210,
		@"coords": @[@49.6590646, @13.819072]
	};
	
	const NSDictionary * standard =
	@{
		@"status": @300,
		@"geo": geoAccurate
	};
	_standard = [[GDAddress alloc] initWithResponse: standard];
}

- (void)test1HasStatus {
	XCTAssertTrue([[_standard status] integerValue] == GDAddressOK, "Missing address status");
}

- (void)test2HasGeoCoords {
	XCTAssertTrue([[_standard geoCoords] isKindOfClass: [CLLocation class]], "Missing geo coordinates");
}

- (void)test3HasGeoStatus {
	XCTAssertTrue([_standard geoStatus] == GDAddressDataAccurate, "Missing address status");
}

@end