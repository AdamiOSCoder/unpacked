import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/routing/routeConfig.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:flutter_web/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                        child: CustomText(
                      text: "UnPacked App",
                      size: 20,
                      weight: FontWeight.bold,
                      color: dark,
                    )),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
                const SizedBox(height: 30,)
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: RouteConfig.sideMenuItemRoutes
                .map((item) => SideMenuItem(
                itemName: item.name,
                onTap: () {
                  // if(item.route == authenticationPageRoute){
                  //   Get.offAllNamed(authenticationPageRoute);
                  //   menuController.changeActiveItemTo(overviewPageDisplayName);
                  // }
                  if (!menuController.isActive(item.name)) {
                    menuController.changeActiveItemTo(item.name);
                    if(ResponsiveWidget.isSmallScreen(context)) {
                      Get.back();
                    }
                    navigationController.navigateTo(item.route);
                  }

                }))
                .toList(),
          )
        ],
      ),
    );
  }
}
