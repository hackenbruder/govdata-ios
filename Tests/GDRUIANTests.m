#import <XCTest/XCTest.h>
#import "GDRUIAN.h"

@interface GDRUIANTests : XCTestCase
@property (nonatomic, strong) const GDRUIAN * standard;
@end

@implementation GDRUIANTests

- (void)setUp {
	[super setUp];
	
	const NSDictionary * standard =
	@{
		@"address_id": @123,
		@"city": @"city",
		@"city_area1": @"city area1",
		@"city_area2": @"city area2",
		@"district": @"district",
		@"street": @"street",
		@"number1": @1,
		@"number2": @2,
		@"number2_character": @"a",
		@"number_type": @"type",
		@"postal_code": @10000,
		@"updated_at": @1386720000
	};
	_standard = [[GDRUIAN alloc] initWithResponse: standard];
}

- (void)test1ReturnsAddressId {
	const NSNumber * n = [_standard addressId];
	XCTAssertTrue([n isKindOfClass: [NSNumber class]] && n > 0, "Missing address id");
}

- (void)test2ReturnsCity {
	const NSString * s = [_standard city];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing city");
}

- (void)test3ReturnsCityArea1 {
	const NSString * s = [_standard cityArea1];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing area 1");
}

- (void)test4ReturnsCityArea2 {
	const NSString * s = [_standard cityArea2];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing area 2");
}

- (void)test5ReturnsDistrict {
	const NSString * s = [_standard district];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing district");
}

- (void)test6ReturnsStreet {
	const NSString * s = [_standard street];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing street");
}

- (void)test7ReturnsNumber1 {
	const NSNumber * n = [_standard number1];
	XCTAssertTrue([n isKindOfClass: [NSNumber class]] && n > 0, "Missing number1");
}

- (void)test8ReturnsNumber2 {
	const NSNumber * n = [_standard number2];
	XCTAssertTrue([n isKindOfClass: [NSNumber class]] && n > 0, "Missing number2");
}

- (void)test9ReturnsNumber2Character {
	const NSString * s = [_standard number2Character];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing number2 character");
}

- (void)test10ReturnsNumberType {
	const NSString * s = [_standard numberType];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing number type");
}

- (void)test11ReturnsPostalCode {
	const NSNumber * n = [_standard postalCode];
	XCTAssertTrue([n isKindOfClass: [NSNumber class]] && n > 0, "Missing postal code");
}

- (void)test12ReturnsUpdateDate {
	const NSDate * s = [_standard updatedAt];
	XCTAssertTrue([s isKindOfClass: [NSDate class]], "Missing update date");
}

- (void)test13HasCity {
	XCTAssertTrue([_standard hasCity], "Invalid city presence report");
}

- (void)test14HasDistrict {
	XCTAssertTrue([_standard hasDistrict], "Invalid district presence report");
}

- (void)test15HasStreet {
	XCTAssertTrue([_standard hasStreet], "Invalid street presence report");
}

- (void)test16HasNumber {
	XCTAssertTrue([_standard hasNumber], "Invalid number presence report");
}

- (void)test17IsPrague {
	XCTAssertTrue([_standard isPrague], "Invalid is Prague report");
}

- (void)test18IsCityDisctrict {
	XCTAssertFalse([_standard isCityDistrict], "Invalid is city a district report");
}

@end
