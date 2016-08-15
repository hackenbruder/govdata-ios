#import <Foundation/Foundation.h>
#import "GDSearchResultEntity.h"
#import "GDSearchResultAddress.h"

@interface GDSearchResults : NSObject

@property (nonatomic, readonly) GDSearchResultsTypeEnum type;
@property (nonatomic, readonly) int page;
@property (nonatomic, readonly, strong) const NSNumber * total;
@property (nonatomic, readonly, strong) const NSNumber * pages;
@property (nonatomic, readonly, strong) const NSArray * results;

- (id)initWithResponse:(id) response page:(int) page;

- (BOOL)hasResults;

@end

typedef void (^GDSearchResponse)(const GDSearchResults *);