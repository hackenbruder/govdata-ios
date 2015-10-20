#import <Foundation/Foundation.h>
#import "GDError.h"
#import "GDHelpers.h"
#import "GDVAT.h"

@interface GDEntity : NSObject

@property (nonatomic, readonly, strong) const NSDictionary * registers;
@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly, strong) const NSString * name;
@property (nonatomic, readonly, strong) const NSDate * foundedAt;
@property (nonatomic, readonly, strong) const GDVAT * vat;

- (id)initWithResponse:(id) response;

- (const GDVAT *)vat:(const GDError **) error;

- (BOOL)hasVAT;

@end

typedef void (^GDEntityResponse)(const GDEntity *);