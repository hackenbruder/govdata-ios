#import <XCTest/XCTest.h>
#import "GDVAT.h"

@interface GDVATTests : XCTestCase
@property (nonatomic, strong) const GDVAT * standard;
@property (nonatomic, strong) const GDVAT * noAccounts;
@property (nonatomic, strong) const GDVAT * missingVAT;
@property (nonatomic, strong) const GDVAT * noVAT;
@end

@implementation GDVATTests

- (void)setUp {
	[super setUp];
	
	//mock data
	const NSDictionary * standard =
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
	};
	_standard = [[GDVAT alloc] initWithResponse: standard];
	
	const NSDictionary * noAccounts =
	@{
		@"updated_at": @1439926209070,
		@"accounts":
			@[],
		@"unreliable": @TRUE,
		@"tax_office_id": @"463",
		@"dic": @"0123456789",
	};
	_noAccounts = [[GDVAT alloc] initWithResponse: noAccounts];
	
	const NSDictionary * missingVAT =
	@{};
	_missingVAT = [[GDVAT alloc] initWithResponse: missingVAT];
}

- (void)test1ReturnsUpdateDate {
	const NSDate * s = [_standard updatedAt];
	XCTAssertTrue([s isKindOfClass: [NSDate class]], "Missing update date");
}

- (void)test2ReturnsNumber {
	const NSString * s = [_standard number];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing number");
}

- (void)test3HasAccounts {
	BOOL t1 = [_standard hasAccounts];
	BOOL t2 = [_noAccounts hasAccounts];
	XCTAssertTrue(t1 && !t2, "Invalid account presence report");
}

- (void)test4ReturnsAccounts {
	const GDAccounts * a1 = [_standard accounts];
	const GDAccounts * a2 = [_noAccounts accounts];
	XCTAssertTrue([a1 count] > 0 && [a2 count] == 0, "Invalid account response");
}

- (void)test5ReturnsUnreliability {
	BOOL t1 = [_standard isUnreliable];
	BOOL t2 = [_noAccounts isUnreliable];
	XCTAssertTrue(!t1 && t2, "Invalid reliability report");
}

- (void)test6HasDescription {
	const NSString * s = [_standard description];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing description");
}

@end
