#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "GDHelpers.h"

typedef NS_ENUM(NSInteger, AddressStatus) {
	GDAddressOK								=	300, //@"address ok"
	GDAddressMissingData			= 305, //@"address is missing data"
	GDAddressRUIANPending			= 310, //@"address ruian translation pending"
	GDAddressGeoPending				= 315, //@"address geocoding pending"
};

typedef NS_ENUM(NSInteger, AddressDataStatus) {
	GDAddressDataUnavailable	= 200, //@"address data unavailable"
	GDAddressDataInaccurate		= 205, //@"address data inaccurate"
	GDAddressDataAccurate			= 210, //@"address data accurate"
};

@interface GDAddress : NSObject

@property (nonatomic, readonly, strong) const NSNumber * status;
@property (nonatomic, readonly) AddressDataStatus geoStatus;
@property (nonatomic, readonly, strong) const CLLocation * geoCoords;

- (id)initWithResponse:(id) response;

@end