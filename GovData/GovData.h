#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#import "GDError.h"
#import "GDEntity.h"

typedef void (^GDResponse)(id response);

@interface GovData : NSObject

@property (nonatomic, readonly, strong) const NSString * url;
@property (nonatomic, readonly, strong) const NSString * stage;
@property (nonatomic, readonly, strong) const NSString * key;
@property (nonatomic, readonly, strong) const AFHTTPRequestOperationManager * requestManager;

- (id)init;
- (id)initWithConfig:(const NSString *) stage key:(const NSString *) key;

- (void)setDefaults;

- (void)setHeaders;
- (NSString *)getURL:(const NSString *) method;
- (void)get:(NSString *) url success:(GDResponse) success failure:(GDErrorResponse) failure;
	
- (void)findEntityByNumber:(const NSString *) number success:(GDEntityResponse) success failure:(GDErrorResponse) failure;

@end