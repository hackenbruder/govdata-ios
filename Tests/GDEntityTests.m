#import <XCTest/XCTest.h>
#import "GDEntity.h"

@interface GDEntityTests : XCTestCase
@property (nonatomic, strong) const GDEntity * standard;
@property (nonatomic, strong) const GDEntity * missingVAT;
@property (nonatomic, strong) const GDEntity * noVAT;
@end

@implementation GDEntityTests

- (void)setUp {
	[super setUp];
	
	//mock data
	const NSDictionary * standard =
	@{
		@"number": @"0123456789",
		@"address": @"",
		@"name": @"Testing name",
		@"registers":
			@{
				@"small_business": @TRUE,
				@"vat": @TRUE,
				@"business": @TRUE,
				@"statistical": @TRUE
			},
		@"vat":
			@{
				@"updated_at": @1439926209070,
				@"accounts":
					@[
						@{
							@"account_number": @"CZ0123400000000123456789",
							@"published_at": @1400112000000
						},
						@{
							@"prefix": @"1234",
							@"account_number": @"2400012345",
							@"bank_code": @"1234",
							@"published_at": @1400112000000
						}
					],
				@"unreliable": @FALSE,
				@"tax_office_id": @"463",
				@"dic": @"0123456789",
			},
		@"founded_at": @1400112000000
	};
	_standard = [[GDEntity alloc] initWithResponse: standard];
	
	const NSDictionary * missingVAT =
	@{
		@"number": @"0123456789",
		@"address": @"",
		@"name": @"Testing name",
		@"registers":
			@{
				@"small_business": @TRUE,
				@"vat": @TRUE,
				@"business": @TRUE,
				@"statistical": @TRUE
				},
		@"vat": @"",
		@"founded_at": @1400112000000
		};
	_missingVAT = [[GDEntity alloc] initWithResponse: missingVAT];
	
	const NSDictionary * noVAT =
	@{
		@"number": @"0123456789",
		@"address": @"",
		@"name": @"Testing name",
		@"registers":
			@{
				@"small_business": @TRUE,
				@"vat": @FALSE,
				@"business": @TRUE,
				@"statistical": @TRUE
			},
		@"vat": @"",
		@"founded_at": @1400112000000
	};
	_noVAT = [[GDEntity alloc] initWithResponse: noVAT];
}

- (void)test1ReturnsNumber {
	const NSString * s = [_standard number];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing number (ICO)");
}

- (void)test2HasName {
	const NSString * s = [_standard name];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing name");
}

- (void)test3HasFoundationDate {
	const NSDate * s = [_standard foundedAt];
	XCTAssertTrue([s isKindOfClass:[NSDate class]], "Missing foundation date");
}

- (void)test4HasDescription {
	const NSString * s = [_standard description];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing description");
}

- (void)test5HasVAT {
	BOOL t1 = [_noVAT hasVAT];
	BOOL t2 = [_standard hasVAT];
	XCTAssertTrue(!t1 && t2, "Invalid VAT presence test");
}

- (void)test6ReturnsVAT {
	GDError * error;
	const GDVAT * vat = [_standard vat: &error];
	XCTAssertTrue(error == nil && vat != nil, "Missing VAT");
}

- (void)test7ReturnsMissingVATError {
	GDError * error;
	const GDVAT * vat = [_missingVAT vat: &error];
	XCTAssertTrue([error code] == GDErrorDataUnavailable && vat == nil, "Invalid missing VAT error");
}

@end