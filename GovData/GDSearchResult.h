#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "GDHelpers.h"
#import "GDTypes.h"

@interface GDSearchResult : NSObject

@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly, strong) const NSString * name;
@property (nonatomic, readonly, strong) const NSDate * foundedAt;
@property (nonatomic, readonly) GDAddressDataStatus geoStatus;
@property (nonatomic, readonly) CLLocationCoordinate2D geo;

- (id)initWithResponse:(id) response;

- (BOOL)hasGeo;

+ (const NSArray<const GDSearchResult *> *)createWithResponse:(id) response;

@end