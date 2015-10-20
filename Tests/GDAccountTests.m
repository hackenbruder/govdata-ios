#import <XCTest/XCTest.h>
#import "GDAccount.h"

@interface GDAccountTests : XCTestCase
@property (nonatomic, strong) const GDAccount * local;
@property (nonatomic, strong) const GDAccount * intl;
@end

@implementation GDAccountTests

- (void)setUp {
	[super setUp];
	
	//mock data
	const NSDictionary * intl =
	@{
		@"account_number": @"CZ0123400000000123456789",
		@"published_at": @1400112000000
	};
	_intl = [[GDAccount alloc] initWithResponse: intl];
	
	const NSDictionary * local =
	@{
		@"prefix": @"1234",
		@"account_number": @"2400012345",
		@"bank_code": @"1234",
		@"published_at": @1400112000000
	};
	_local = [[GDAccount alloc] initWithResponse: local];
}

- (void)test1HasPublishedDate {
	const NSDate * s = [_local publishedAt];
	XCTAssertTrue([s isKindOfClass: [NSDate class]], "Missing published date");
}

- (void)test2ReturnsNumber {
	const NSString * s = [_local number];
	XCTAssertTrue([s isKindOfClass: [NSString class]] && [s length] > 0, "Missing number");
}

- (void)test3ReturnsLocality {
	BOOL t1 = [_local isLocal];
	BOOL t2 = [_intl isLocal];
	XCTAssertTrue(t1 && !t2, "Returns invalid locality");
}

- (void)test4ReturnsInternationality {
	BOOL t1 = [_local isIntl];
	BOOL t2 = [_intl isIntl];
	XCTAssertTrue(!t1 && t2, "Returns invalid internationality");
}

- (void)test5HasPrefix {
	BOOL t1 = [_local hasPrefix];
	BOOL t2 = [_intl hasPrefix];
	XCTAssertTrue(t1 && !t2, "Invalid prefix presence");
}

- (void)test6HasBankCode {
	BOOL t1 = [_local hasBankCode];
	BOOL t2 = [_intl hasBankCode];
	XCTAssertTrue(t1 && !t2, "Invalid bank code presence");
}

- (void)test7HasDescription {
	const NSString * s = [_local description];
	XCTAssertTrue([s isKindOfClass:[NSString class]] && [s length] > 0, "Missing description");
}
@end
