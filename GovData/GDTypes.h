typedef NS_ENUM(NSInteger, GDErrorEnum) {
	GDErrorGeneric						= 100, //@"api request error"
	GDErrorThrottled					= 105, //@"api request was throttled"
	GDErrorNotFound						= 110, //@"requested content was not found"
	GDErrorInvalidRequest			= 115, //@"invalid request"
	GDErrorDataUnavailable		= 120, //@"data unavailable or missing"
	GDErrorCancelled					= 125, //@"request was cancelled"
};

typedef NS_ENUM(NSInteger, GDAddressStatus) {
	GDAddressOK								=	300, //@"address ok"
	GDAddressMissingData			= 305, //@"address is missing data"
	GDAddressRUIANPending			= 310, //@"address ruian translation pending"
	GDAddressGeoPending				= 315, //@"address geocoding pending"
};

typedef NS_ENUM(NSInteger, GDAddressDataStatus) {
	GDAddressDataUnavailable	= 200, //@"address data unavailable"
	GDAddressDataInaccurate		= 205, //@"address data inaccurate"
	GDAddressDataAccurate			= 210, //@"address data accurate"
};

typedef NS_ENUM(NSInteger, GDSearchResultsTypeEnum) {
	GDSearchResultsInvalid		= 400,
	GDSearchResultsEntities		= 405,
	GDSearchResultsAddresses	= 410,
};