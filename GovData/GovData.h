#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#import "GDError.h"
#import "GDEntity.h"
#import "GDSearchResults.h"

typedef void (^GDResponse)(id response);

@interface GovData : NSObject

@property (nonatomic, readonly, strong) const NSString * url;
@property (nonatomic, readonly, strong) const NSString * stage;
@property (nonatomic, readonly, strong) const NSString * key;
@property (nonatomic, readonly, strong) const AFHTTPSessionManager * requestManager;

- (id)init;
- (id)initWithConfig:(const NSString *) stage key:(const NSString *) key;

- (void)setDefaults;

- (void)setHeaders;
- (NSString *)getURL:(const NSString *) method;
- (NSURLSessionDataTask *)get:(NSString *) url success:(GDResponse) success failure:(GDErrorResponse) failure;
	
- (NSURLSessionDataTask *)findEntityByNumber:(const NSString *) number success:(GDEntityResponse) success failure:(GDErrorResponse) failure;
- (NSURLSessionDataTask *)findEntitiesByGeo:(const CLLocationCoordinate2D *) coords radius:(int) radius page:(int) page success:(GDSearchResponse) success failure:(GDErrorResponse) failure;
- (NSURLSessionDataTask *)findEntitiesByName:(const NSString *) name page:(int) page success:(GDSearchResponse) success failure:(GDErrorResponse) failure;

@end