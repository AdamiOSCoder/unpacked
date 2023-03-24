import 'package:flutter/material.dart';
import 'package:flutter_web/pages/help/help_page.dart';
import 'package:flutter_web/pages/home/home_page.dart';
import 'package:flutter_web/pages/setting/page/about_page.dart';
import 'package:flutter_web/pages/setting/page/disclaimer_page.dart';
import 'package:flutter_web/pages/setting/page/personal_page.dart';
import 'package:flutter_web/pages/setting/page/recharge_page.dart';
import 'package:flutter_web/routing/routeConfig.dart';
import 'package:flutter_web/pages/login/authentication.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
 switch(settings.name) {
   case RouteConfig.home:
     return _getPageRoute(const HomePage());
   case RouteConfig.help:
     return _getPageRoute(const HelpPage());
   case RouteConfig.authentication:
     return _getPageRoute( AuthenticationPage());
   case RouteConfig.personal:
     return _getPageRoute( const PersonalPage());
   case RouteConfig.recharge:
     return _getPageRoute( const RechargePage());
   case RouteConfig.aboutMe:
     return _getPageRoute( const AboutMePage());
   case RouteConfig.disclaimer:
     return _getPageRoute(  DisclaimerPage());
  default:
     return _getPageRoute(const HomePage());
 }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}