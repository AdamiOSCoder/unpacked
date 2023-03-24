import 'package:flutter/material.dart';
import 'package:flutter_web/pages/applist/widgets/applist_table.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../constants/styles.dart';
import '../../controllers/app_info_controller.dart';

class AppListPage extends StatelessWidget {
  String? title;
  AppListPage({Key? key, this.title}) : super(key: key);
  // final AppInfoController controller = Get.put(AppInfoController());

  @override
  Widget build(BuildContext context) {
    //controller.fetchAppInfo(title!);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                  //top: ResponsiveWidget.isSmallScreen(context) ? 56 : 20),
                  top: 20),
              child: CustomText(
                text: title,
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  AppListTable()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
