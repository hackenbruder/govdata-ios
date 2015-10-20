#import <XCTest/XCTest.h>
#import "GDError.h"

@interface GDErrorTests : XCTestCase
@end

@implementation GDErrorTests

- (void)test1CreateWithCode {
	const GDError * error = [GDError createWithCode: GDErrorThrottled];
	XCTAssertNotNil(error, "Error was nil");
	XCTAssertEqual([error code], GDErrorThrottled, "Error code doesn't match Throttled error");
}

- (void)test2CreateWithResponse {
	NSDictionary * response = @{ @"code": @110, @"message": @"record not found" };
	const GDError * error = [GDError createWithResponse: response];
	XCTAssertNotNil(error, "Error was nil");
	XCTAssertEqual([error code], GDErrorNotFound, "Error code doesn't match Not Found error");
}

@end