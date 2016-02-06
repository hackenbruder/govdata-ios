#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "GDTypes.h"

@interface GDAddress : NSObject

@property (nonatomic, readonly) AddressStatus status;
@property (nonatomic, readonly) AddressDataStatus geoStatus;
@property (nonatomic, readonly, strong) const CLLocation * geoCoords;

- (id)initWithResponse:(id) response;

@end