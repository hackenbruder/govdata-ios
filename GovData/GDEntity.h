#import <Foundation/Foundation.h>

#import "GDError.h"
#import "GDHelpers.h"
#import "GDVAT.h"
#import "GDAddress.h"

@interface GDEntity : NSObject

@property (nonatomic, readonly, strong) const NSDictionary * registers;
@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly, strong) const NSString * name;
@property (nonatomic, readonly, strong) const NSDate * foundedAt;
@property (nonatomic, readonly, strong) const GDVAT * vat;
@property (nonatomic, readonly, strong) const GDAddress * address;

- (id)initWithResponse:(id) response;

- (const GDVAT *)vat:(const GDError **) error;
- (const GDAddress *)address:(const GDError **) error;

- (BOOL)hasVAT;

@end

typedef void (^GDEntityResponse)(const GDEntity *);