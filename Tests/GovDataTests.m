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
	
	[_govdata findEntityByNumber:@"123" success: success failure: failure];
	
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

	[_govdata findEntityByNumber:@"00006947" success: success failure: failure];
	
	[self waitForExpectationsWithTimeout:5 handler:^(NSError * error) {
		if (error != nil) {
			XCTFail(@"%@", error.localizedDescription);
		}
	}];
}

- (void)test3GeoQueryResultsFound {
	XCTestExpectation * expectation = [self expectationWithDescription:@"Returns an entity"];
	
	GDErrorResponse failure = ^(const GDError * error) {
		XCTFail(@"%@", error.localizedDescription);
	};
	
	GDSearchResponse success = ^(const GDSearchResults * response) {
		XCTAssertNotNil(response, "Search succeeded");
		[expectation fulfill];
	};
	
	[_govdata findEntitiesByGeo:@50.08915042002743 longitude:@14.407195183397297 radius:@100 page:@1 success: success failure: failure];
	
	[self waitForExpectationsWithTimeout:5 handler:^(NSError * error) {
		if (error != nil) {
			XCTFail(@"%@", error.localizedDescription);
		}
	}];
}

@end
