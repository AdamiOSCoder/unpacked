import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_download_table.dart';
import 'home_view_small.dart';
import 'home_view_large.dart';
import 'home_view_medium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/helpers/responsiveness.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Obx(() => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 20,
                  weight: FontWeight.bold,
                ),
              )
            ],
          )),
      screen(context)
    ]);
  }

  Widget screen(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      if (ResponsiveWidget.isCustomScreen(context)) {
        return Expanded(child: HomeViewMediumScreen());
      } else {
        return Column(
          children: [
            HomeViewLargeScreen(),
            const SizedBox(height: 10),
            AppDownLoadTable()
          ],
        );
      }
    } else {
       return Expanded(child: HomeViewSmallScreen());
    }
  }
}
