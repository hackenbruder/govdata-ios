#import <Foundation/Foundation.h>
#import "GDError.h"
#import "GDHelpers.h"
#import "GDTypes.h"

@interface GDRUIAN : NSObject

@property (nonatomic, readonly, strong) const NSNumber * addressId;
@property (nonatomic, readonly, strong) const NSString * city;
@property (nonatomic, readonly, strong) const NSString * cityArea1;
@property (nonatomic, readonly, strong) const NSString * cityArea2;
@property (nonatomic, readonly, strong) const NSString * district;
@property (nonatomic, readonly, strong) const NSString * street;
@property (nonatomic, readonly, strong) const NSNumber * number1;
@property (nonatomic, readonly, strong) const NSNumber * number2;
@property (nonatomic, readonly, strong) const NSString * number2Character;
@property (nonatomic, readonly, strong) const NSString * numberType;
@property (nonatomic, readonly, strong) const NSNumber * postalCode;
@property (nonatomic, readonly, strong) const NSDate * updatedAt;

- (id)initWithResponse:(id) response;

- (BOOL)isPrague;
- (BOOL)isCityDistrict;
- (BOOL)hasCity;
- (BOOL)hasDistrict;
- (BOOL)hasStreet;
- (BOOL)hasNumber;

- (const NSString *)number:(const GDError **) error;

@end