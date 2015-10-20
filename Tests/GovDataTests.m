#import <XCTest/XCTest.h>
#import "GovData.h"

@interface GovDataTests : XCTestCase
@property (nonatomic, strong) const GovData * govdata;
@end

@implementation GovDataTests

- (void)setUp {
	_govdata = [[GovData alloc] init];
}

- (void)test1QueryResultNotFound {
	XCTestExpectation * expectation = [self expectationWithDescription:@"Returns an error"];

	GDErrorResponse failure = ^(const GDError * error) {
		if ([error code] == GDErrorNotFound) {
			[expectation fulfill];
		} else {
			XCTFail(@"%@", error.localizedDescription);
		}
	};
	
	GDEntityResponse success = ^(const GDEntity * entity) {
		XCTAssertNotNil(entity, "Entity Found");
	};
	
	[self.govdata findEntityByNumber:@"123" success: success failure: failure];
	
	[self waitForExpectationsWithTimeout:5 handler:^(NSError * error) {
		if (error != nil) {
			XCTFail(@"%@", error.localizedDescription);
		}
	}];
}

- (void)test2QueryResultFound {
	XCTestExpectation * expectation = [self expectationWithDescription:@"Returns an entity"];
	
	GDErrorResponse failure = ^(const GDError * error) {
		XCTFail(@"%@", error.localizedDescription);
	};
	
	GDEntityResponse success = ^(const GDEntity * entity) {
		XCTAssertNotNil(entity, "Entity Found");
		[expectation fulfill];
	};

	[self.govdata findEntityByNumber:@"00006947" success: success failure: failure];
	
	[self waitForExpectationsWithTimeout:5 handler:^(NSError * error) {
		if (error != nil) {
			XCTFail(@"%@", error.localizedDescription);
		}
	}];
}

@end
