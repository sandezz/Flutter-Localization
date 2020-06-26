import 'package:flutter/material.dart';
import 'package:pm/pages/about_page.dart';
import 'package:pm/pages/home_page.dart';
import 'package:pm/pages/not_found_page.dart';
import 'package:pm/pages/settings_page.dart';
import 'package:pm/routes/route_name.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
        break;
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
        break;
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
