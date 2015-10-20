#import <Foundation/Foundation.h>
#import "GDHelpers.h"

@interface GDAccount : NSObject

@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly, strong) const NSString * prefix;
@property (nonatomic, readonly, strong) const NSString * bankCode;
@property (nonatomic, readonly, strong) const NSDate * publishedAt;

- (id)initWithResponse:(id) response;

- (BOOL)isLocal;
- (BOOL)isIntl;
- (BOOL)hasPrefix;
- (BOOL)hasBankCode;

- (const NSString *)description;

+ (const NSArray<const GDAccount *> *)createWithResponse:(id) response;

@end

typedef NSArray<const GDAccount *> GDAccounts;