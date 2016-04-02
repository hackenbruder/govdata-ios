#import "GovData.h"

@implementation GovData

- (id)initWithConfig:(const NSString *) stage key:(const NSString *) key {
	self = [self init];
	_stage = stage;
	_key = key;
	[self setHeaders];
	return self;
}

- (id)init {
	self = [super init];
	if(self) {
		_requestManager = [AFHTTPSessionManager manager];
		_requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
		_requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
		[self setDefaults];
		[self setHeaders];
	}
	return self;
}

- (void)setDefaults {
	_url		= @"https://api.govdata.cz/v1/";
	_stage	= @"demo";
	_key		= @"ZX1Ap4RUDY2VisBOu2P0e4sEvh2LhWh4Cx8lqoO6";
}

- (void)setHeaders {
	[_requestManager.requestSerializer setValue:(NSString *)_key forHTTPHeaderField:@"x-api-key"];
}

- (NSString *)getURL:(const NSString *) method {
	return [NSString stringWithFormat:@"%@%@/%@", _url, _stage, method];
}

- (void)get:(NSString *) url success:(GDResponse) success failure:(GDErrorResponse) failure {
	[_requestManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * operation, id responseObject) {
		NSHTTPURLResponse * response = (NSHTTPURLResponse *)operation.response;
		id errorObject = [responseObject objectForKey:@"error"];
		if (response.statusCode == 200) {
			success(responseObject);
		} else if (errorObject) {
			failure([GDError createWithResponse: errorObject]);
		} else {
			failure([GDError createWithCode: GDErrorGeneric]);
		}
	} failure:^(NSURLSessionDataTask * operation, NSError * error) {
		NSHTTPURLResponse * response = (NSHTTPURLResponse *)operation.response;
		NSData * data = [error.userInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey];
		NSError * jsonError;
		NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		id errorObject = [responseObject objectForKey:@"error"];
		if (response.statusCode == 429) {
			failure([GDError createWithCode: GDErrorThrottled]);
		} else if (errorObject) {
			failure([GDError createWithResponse: errorObject]);
		} else {
			failure([GDError createWithCode: GDErrorGeneric]);
		}
	}];
}

- (void)findEntityByNumber:(const NSString *) number success:(GDEntityResponse) success failure:(GDErrorResponse) failure {
	NSString * url = [self getURL: [NSString stringWithFormat:@"entity/%@", number]];
	
	[self get: url success:^(id response) {
		success([[GDEntity alloc] initWithResponse: response]);
	} failure: failure];
}

- (void)findEntitiesByGeo:(const CLLocationCoordinate2D *) coords radius:(int) radius page:(int) page success:(GDSearchResponse) success failure:(GDErrorResponse) failure {
	NSString * url = [self getURL: [NSString stringWithFormat:@"search/geo"]];
	NSURLComponents * components = [NSURLComponents componentsWithString:url];
	components.queryItems =
	@[
		[NSURLQueryItem queryItemWithName:@"lat" value:[@(coords->latitude) stringValue]],
		[NSURLQueryItem queryItemWithName:@"lon" value:[@(coords->longitude) stringValue]],
		[NSURLQueryItem queryItemWithName:@"radius" value:[@(radius) stringValue]],
		[NSURLQueryItem queryItemWithName:@"page" value:[@(page) stringValue]]
	];

	[self get: [components.URL absoluteString] success:^(id response) {
		success([[GDSearchResults alloc] initWithResponse: response page:page]);
	} failure: failure];
}

@end