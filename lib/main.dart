import 'package:flutter/material.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/controllers/menu_controller.dart';
import 'package:flutter_web/controllers/navigation_controller.dart';
import 'package:flutter_web/routing/routeConfig.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'layout.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  Get.put(MenusController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConfig.home,
      // unknownRoute: GetPage(
      //     name: RouteConfig.noFound,
      //     page: () => const NotFoundPage(),
      //     ),
      getPages: RouteConfig.getPages,
      debugShowCheckedModeBanner: false,
      title: 'UnPacked App',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
        }),
        primarySwatch: Colors.blue,
      ),
       //home: SiteLayout(),
    );
  }
}
