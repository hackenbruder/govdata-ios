#import <Foundation/Foundation.h>

#import "GDHelpers.h"

@interface GDSearchResult : NSObject

@property (nonatomic, readonly, strong) const NSString * number;
@property (nonatomic, readonly, strong) const NSString * name;
@property (nonatomic, readonly, strong) const NSDate * foundedAt;

- (id)initWithResponse:(id) response;

+ (const NSArray<const GDSearchResult *> *)createWithResponse:(id) response;

@end