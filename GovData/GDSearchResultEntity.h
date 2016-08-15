#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "GDHelpers.h"
#import "GDTypes.h"

@interface GDSearchResultEntity : NSObject

@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly, strong) const NSString * name;
@property (nonatomic, readonly, strong) const NSNumber * type;
@property (nonatomic, readonly, strong) const NSDate * foundedAt;
@property (nonatomic, readonly) GDAddressDataStatus geoStatus;
@property (nonatomic, readonly) CLLocationCoordinate2D geo;

- (id)initWithResponse:(id) response;

- (const NSString *)typeDescription;
- (BOOL)hasGeo;

+ (const NSArray<const GDSearchResultEntity *> *)createWithResponse:(id) response;

@end