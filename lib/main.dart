import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pm/routes/custom_router.dart';
import 'package:pm/routes/route_name.dart';
import 'localization/localization.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Queue Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      locale: _locale,
      supportedLocales: [
        const Locale('en', 'US'), // English, US country code
        const Locale('he', 'IL'), // Hebrew, no country code
        const Locale('hi', 'IN'), //Hindi, India
        const Locale('ar', 'SA'), //Arabic, South Arabia
        const Locale('es', '') //Spanish
      ],
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   for (var locale in supportedLocales) {
      //     if (locale.languageCode == deviceLocale.languageCode &&
      //         locale.countryCode == deviceLocale.countryCode)
      //       return deviceLocale;
      //   }
      //   return supportedLocales.first;
      // },
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
