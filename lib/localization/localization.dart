import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Localization {
  final Locale localeName;

  Localization(this.localeName);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  Map<String, String> _localizedValues;

  Future load() async {
    print(localeName.languageCode);
    String jsonStringValues =
        await rootBundle.loadString('lib/lang/${localeName.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedRealValue(String key) {
    print(_localizedValues);
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<Localization> delegate =
      _LocalizationDelegate();
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'he', 'hi', 'ar', 'es'].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    Localization localization = new Localization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
