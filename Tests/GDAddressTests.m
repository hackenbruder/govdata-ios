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
	
	const NSDictionary * ruianAvailable =
	@{
		@"status": @210,
		@"data": @{},
		@"formatted": @[
			@"line1",
			@"line2",
			@"line3"
		]
	};
	
	const NSDictionary * standard =
	@{
		@"status": @300,
		@"geo": geoAccurate,
		@"ruian": ruianAvailable
	};
	_standard = [[GDAddress alloc] initWithResponse: standard];
}

- (void)test1HasStatus {
	XCTAssertTrue([_standard status] == GDAddressOK, "Missing address status");
}

- (void)test2HasGeoStatus {
	XCTAssertTrue([_standard geoStatus] == GDAddressDataAccurate, "Missing geo data status");
}

- (void)test3HasGeo {
	XCTAssertTrue([[_standard geo] isKindOfClass: [CLLocation class]], "Missing geo");
}

- (void)test4HasRUIANStatus {
	XCTAssertTrue([_standard ruianStatus] == GDAddressDataAccurate, "Missing ruian data status");
}

- (void)test5HasRUIAN {
	XCTAssertTrue([[_standard ruian] isKindOfClass: [GDRUIAN class]], "Missing ruian");
}

- (void)test6HasFormatted {
	GDError * error;
	const NSArray<const NSString *> * f = [_standard formatted: &error];
	XCTAssertTrue(error == nil && [f isKindOfClass:[NSArray class]] && [f count] > 0, "Missing formatted address");
}

- (void)test7HasDescription {
	const NSString * s = [_standard description];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing description");
}

@end