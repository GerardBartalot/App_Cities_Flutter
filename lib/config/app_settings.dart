import 'package:flutter/foundation.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

/// Internationalization
/// Modifica esta variable para asociar la configuración dependiendo de la zona geográfica.
final defaultLocale =
    PlatformDispatcher
        .instance
        .locale
        .languageCode; // {en_US, es_ES, fr_FR, en, es, fr}
final defaultLanguage =
    PlatformDispatcher.instance.locale.countryCode; // {en, es, fr}

/// Crear el Locale del idioma por defecto del dispositivo.
String get defaultDeviceLanguage {
  String defLocale = defaultLocale;
  if (defaultLanguage != null) {
    defLocale += '_$defaultLanguage'; // <-- P. ej. 'es_ES'
  }
  return defLocale;
}

Map<String, String> get internationalizationSettings {
  switch (defaultLocale) {
    case 'es_ES':
      numberFormatSymbols['es_ES'] = (numberFormatSymbols['es_ES']
              as NumberSymbols)
          .copyWith(currencySymbol: '€');
      return internES;
    case 'en_US':
      numberFormatSymbols[defaultLocale] = (numberFormatSymbols[defaultLocale]
              as NumberSymbols)
          .copyWith(currencySymbol: '\$');
      return internUSA;
    case 'fr_FR':
      numberFormatSymbols['fr_FR'] = (numberFormatSymbols['fr_FR']
              as NumberSymbols)
          .copyWith(currencySymbol: '€');
      return internFR;
    default:
      return internES;
  }
}

extension NumberFormatSymbolsExt on NumberSymbols {
  NumberSymbols copyWith({String? currencySymbol}) {
    return NumberSymbols(
      NAME: NAME,
      DECIMAL_SEP: DECIMAL_SEP,
      GROUP_SEP: GROUP_SEP,
      PERCENT: PERCENT,
      ZERO_DIGIT: ZERO_DIGIT,
      PLUS_SIGN: PLUS_SIGN,
      MINUS_SIGN: MINUS_SIGN,
      EXP_SYMBOL: EXP_SYMBOL,
      PERMILL: PERMILL,
      INFINITY: INFINITY,
      NAN: NAN,
      DECIMAL_PATTERN: DECIMAL_PATTERN,
      SCIENTIFIC_PATTERN: SCIENTIFIC_PATTERN,
      PERCENT_PATTERN: PERCENT_PATTERN,
      CURRENCY_PATTERN: CURRENCY_PATTERN,
      DEF_CURRENCY_CODE: currencySymbol ?? DEF_CURRENCY_CODE,
    );
  }
}

/// Internacionalización España
Map<String, String> get internES => {'locale': 'es_ES', 'currency_symbol': '€'};

/// Internacionalización EEUU
Map<String, String> get internUSA => {
  'locale': 'en_US',
  'currency_symbol': '\$',
};

/// Internacionalización Francia
Map<String, String> get internFR => {'locale': 'fr_FR', 'currency_symbol': '€'};
