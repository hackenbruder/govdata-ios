#import <Foundation/Foundation.h>
#import "GDAccount.h"
#import "GDHelpers.h"

@interface GDVAT : NSObject

@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly) BOOL unreliable;
@property (nonatomic, readonly, strong) const NSArray<const GDAccount *> * accounts;
@property (nonatomic, readonly, strong) const NSDate * updatedAt;

- (id)initWithResponse:(id) response;

- (const NSString *)number;
- (BOOL)hasAccounts;
- (BOOL)isUnreliable;

- (const NSString *) description;

@end
