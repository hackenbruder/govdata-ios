# GovData iOS SDK

[See English version](README.en.md)

Oficiální SDK pro iOS a macOS.

[![Build Status](https://travis-ci.org/hackenbruder/govdata-ios.svg)](https://travis-ci.org/hackenbruder/govdata-ios)

## GovData

`GovData` poskytují vybraná OpenData prostřednictvím API a zjednodušují jejich integraci do aplikací pomocí SDK. Otevřená data, API, SDK a aplikace tvoří ekosystém a kvalitní aplikace mohou vznikat pouze ve fungujícím ekosystému. Naše SDK jsou pokryta testy a služby jsou vysoce dostupné.

Poskytována jsou data ze živnostenského, obchodního a dalších rejstříků, včetně registru plátců daně z přidané hodnoty. Data jsou standardizována a je v nich možné vyhledávat.

Vyzkoušejte si zdarma naši službu a SDK.

## Instalace
### CocoaPods

SDK nainstalujete standardním příkazem:
	
	pod install govdata

Pro správnou funkci statické knihovny je potřebná správná konfigurace `Xcode` projektu pro `CocoaPods` včetně správných cest ke hlavičkovým souborům a konfigurace build Targets. Knihovna je pokryta automatizovanými testy.

Jedinou závislostí SDK je síťová knihovna `AFNetworking`.

## Konfigurace

SDK je dodáváno předkonfigurované jako `demo` s příslušným klíčem a limity. Tuto konfiguraci je možné využít k otestování naší služby a při vývoji vaší aplikace.

Konfigurace SDK se provádí voláním metody `init` na objektu `GovData`:
	
	const GovData * govdata = [[GovData alloc] init];
	
nebo pro produkční použití pomocí stage a klíče:

	const GovData * govdata = [[GovData alloc] initWithConfig:@"<stage>" key:@"<hodnota>"];

## Použití
### Jednoduché hledání

Vyhledání subjektu v obchodním rejstříku pomocí metody `findEntityByNumber`:

	[govdata findEntityByNumber:(const NSString *) number success:(GDEntityResponse) success failure:(GDErrorResponse) failure];
	
Příklad vyhledávání:

	GDErrorResponse failure = ^(const GDError * error) {
		NSLog(@"%@", error.localizedDescription);
		
		//handle error
	};
	
	GDEntityResponse success = ^(const GDEntity * entity) {
		//handle entity
	};

	[govdata findEntityByNumber:@"00006947" success: success failure: failure];

Podrobnější příklad můžete najít [zde](https://gist.github.com/hackenbruder/aca3cde0e48e6257d40a).

### Geoprostorové hledání

Vyhledání subjektů pomocí GPS souřadnic a rádiusu metodou `findEntitiesByGeo`:

	GDSearchResponse success = ^(const GDSearchResults * results) {
		//handle search results
	};
	
	[govdata findEntitiesByGeo:@50.08915042002743 longitude:@14.407195183397297 radius:@100 page:@1 success: success failure: failure];

## Dokumentace

Dokumentace objektů v SDK se připravuje. Dostupné objekty a jejich metody si můžete prohlédnout v [Testech](Tests/?ts=2).

## Licence

[MIT](LICENSE.md)
