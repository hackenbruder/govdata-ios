#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "GDHelpers.h"
#import "GDTypes.h"

@interface GDSearchResultAddress : NSObject

@property (nonatomic, readonly, strong) const NSString * addressId;
@property (nonatomic, readonly, strong) const NSString * text;
@property (nonatomic, readonly, strong) const NSDate * updatedAt;
@property (nonatomic, readonly) GDAddressDataStatus geoStatus;
@property (nonatomic, readonly) CLLocationCoordinate2D geo;

- (id)initWithResponse:(id) response;

- (BOOL)hasGeo;

+ (const NSArray<const GDSearchResultAddress *> *)createWithResponse:(id) response;

@end