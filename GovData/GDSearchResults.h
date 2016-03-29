#import <Foundation/Foundation.h>

#import "GDSearchResult.h"

@interface GDSearchResults : NSObject

@property (nonatomic, readonly, strong) const NSNumber * pages;
@property (nonatomic, readonly, strong) const NSArray<const GDSearchResult *> * results;

- (id)initWithResponse:(id) response;

- (BOOL)hasResults;

@end

typedef void (^GDSearchResponse)(const GDSearchResults *);