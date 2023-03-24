import '../layout.dart';
import 'package:get/get.dart';
import 'package:flutter_web/pages/help/help_page.dart';
import 'package:flutter_web/pages/applist/applist_page.dart';
import 'package:flutter_web/pages/setting/page/about_page.dart';
import 'package:flutter_web/pages/setting/page/personal_page.dart';
import 'package:flutter_web/pages/setting/page/recharge_page.dart';
import 'package:flutter_web/pages/setting/page/disclaimer_page.dart';
import 'package:flutter_web/pages/login/authentication.dart';

class RouteConfig {
  ///主页面
  static const String home = "/home";

  ///帮助页面
  static const String help = "/helpPage";

  ///登录页面
  static const String authentication = "/authenticationPage";

  ///注册页面
  static const String register = "/registerPage";

  ///404
  static const String noFound = "/noFound";

  ///App列表
  static const String appList = "/appList";

  ///个人
  static const String personal = "/personal";

  ///充值
  static const String recharge = "/recharge";

  ///关于我们
  static const String aboutMe = "/aboutMe";

  ///免责声明
  static const String disclaimer = "/disclaimer";

  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => SiteLayout()),
    GetPage(name: authentication, page: () => AuthenticationPage()),
    GetPage(name: help, page: () => const HelpPage()),
    GetPage(name: appList, page: () =>  AppListPage()),
    GetPage(name: personal, page: () => const PersonalPage()),
    GetPage(name: aboutMe, page: () => const RechargePage()),
    GetPage(name: disclaimer, page: () => const AboutMePage()),
    GetPage(name: recharge, page: () =>  DisclaimerPage()),
  ];

  //首页
  static const homePageDisplayName = "首页";
  static const helpPageDisplayName = "使用方法";
  static const registerPageDisplayName = "注册";
  static const authenticationPageDisplayName = "登录";

  static const personalName = "我的";
  static const rechargeName = "充值";
  static const aboutMeName = "关于我们";
  static const disclaimerName = "免责申明";
  static const logoutName = "退出";

  static List<MenuItem> sideMenuItemRoutes = [
    MenuItem(homePageDisplayName, home),
    MenuItem(helpPageDisplayName, help),
    MenuItem(personalName, personal),
    MenuItem(rechargeName, recharge),
    MenuItem(aboutMeName, aboutMe),
    MenuItem(disclaimerName, disclaimer),
    MenuItem(logoutName, authentication),
  ];
}

class MenuItem {
  final String name;
  final String route;
  MenuItem(this.name, this.route);
}
