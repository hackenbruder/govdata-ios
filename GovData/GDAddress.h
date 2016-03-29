#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "GDTypes.h"
#import "GDRUIAN.h"

@interface GDAddress : NSObject

@property (nonatomic, readonly) AddressStatus status;
@property (nonatomic, readonly) AddressDataStatus geoStatus;
@property (nonatomic, readonly, strong) const CLLocation * geo;
@property (nonatomic, readonly) AddressDataStatus ruianStatus;
@property (nonatomic, readonly, strong) const GDRUIAN * ruian;
@property (nonatomic, readonly, strong) const NSArray<const NSString *> * formatted;

- (id)initWithResponse:(id) response;

- (BOOL)hasGeo;
- (BOOL)hasRUIAN;

- (const NSArray<const NSString *> *)formatted:(const GDError **) error;
- (const NSString *)description;

@end