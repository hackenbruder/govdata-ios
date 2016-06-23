# GovData iOS SDK

[Česká verze](README.md)

Official SDK for iOS and macOS.

[![Build Status](https://travis-ci.org/hackenbruder/govdata-ios.svg)](https://travis-ci.org/hackenbruder/govdata-ios)

## GovData

`GovData` provides select OpenData using an API and simplifies it's integration in applications with an SDK. We currently provide data from small business, business and other registries including registry of VAT payers. Data are standardized and searchable. Our SDKs are test-covered and services highly available. We believe OpenData, APIs and SDKs create an ecosystem and high quality apps can only exist in healthy ecosystem.

Try our service and SDK for free.

## Installation
### CocoaPods

Install our SDK with standard command:
	
	pod install govdata

For correct function of our static library you need use proper `Xcode` project configuration for `CocoaPods` including all correct paths to header files and correct build Targets configuration. Library is covered with automated test.

Only dependency of our SDK is `AFNetworking` library.

## Configuration

SDK is pre-configured to use `demo` account with our service with specific key and limits. This configuration can be used to test our service and to develop your app.

SDK configuration can be performed by calling `init` method on `GovData` object:
	
	const GovData * govdata = [[GovData alloc] init];

or for production use using stage and key variables:

	const GovData * govdata = [[GovData alloc] initWithConfig:@"<stage>" key:@"<hodnota>"];

## Usage
### Simple search

Find entities in business registry using `findEntityByNumber` method:

	[govdata findEntityByNumber:(const NSString *) number success:(GDEntityResponse) success failure:(GDErrorResponse) failure];

Search example:

	GDErrorResponse failure = ^(const GDError * error) {
		NSLog(@"%@", error.localizedDescription);
		
		//handle error
	};
	
	GDEntityResponse success = ^(const GDEntity * entity) {
		//handle entity
	};

	[govdata findEntityByNumber:@"00006947" success: success failure: failure];

Please find more detailed example [here](https://gist.github.com/hackenbruder/aca3cde0e48e6257d40a).

### Geospatial search

Entity search using GPS coordinates and radius using `findEntitiesByGeo` method:

	GDSearchResponse success = ^(const GDSearchResults * results) {
		//handle search results
	};
	
	[govdata findEntitiesByGeo:@50.08915042002743 longitude:@14.407195183397297 radius:@100 page:@1 success: success failure: failure];

## Documentation

Documenting SDK objects is in progress. Please explore available objects and their methods in [Tests](Tests/?ts=2).

## License

[MIT](LICENSE.md)
