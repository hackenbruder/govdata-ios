#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "GDTypes.h"
#import "GDRUIAN.h"

@interface GDAddress : NSObject

@property (nonatomic, readonly) GDAddressStatus status;
@property (nonatomic, readonly) GDAddressDataStatus geoStatus;
@property (nonatomic, readonly) CLLocationCoordinate2D geo;
@property (nonatomic, readonly) GDAddressDataStatus ruianStatus;
@property (nonatomic, readonly, strong) const GDRUIAN * ruian;
@property (nonatomic, readonly, strong) const NSArray<const NSString *> * formatted;

- (id)initWithResponse:(id) response;

- (BOOL)hasGeo;
- (BOOL)hasRUIAN;

- (const NSArray<const NSString *> *)formatted:(const GDError **) error;
- (const NSString *)description;

@end