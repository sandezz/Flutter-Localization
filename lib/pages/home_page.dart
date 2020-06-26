import 'package:flutter/material.dart';
import 'package:pm/classes/language.dart';
import 'package:pm/localization/localization.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'he':
        _temp = Locale(language.languageCode, 'IL');
        break;
      case 'hi':
        _temp = Locale(language.languageCode, 'IN');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'SA');
        break;
      case 'es':
        _temp = Locale(language.languageCode, '');
        break;
      default:
        _temp = Locale(language.languageCode, 'US');
    }
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            Localization.of(context).getTranslatedRealValue('app_header'),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(Icons.language, color: Colors.white),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            lang.flag,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(lang.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (Language language) {
                _changeLanguage(language);
                print(language.languageCode);
              },
            ),
          )
        ],
      ),
    );
  }
}
