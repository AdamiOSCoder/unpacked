import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bean/channels_info.dart';
import '../../configure/configure.dart';
import '../../constants/styles.dart';
import '../../controllers/app_info_controller.dart';
import '../../widgets/custom_text.dart';
import '../applist/applist_page.dart';
import '../setting/page/widget/custom_painter.dart';
import 'app_download_table.dart';

class HomeViewMediumScreen extends StatelessWidget {
  HomeViewMediumScreen({Key? key}) : super(key: key);
  final AppInfoController controller = Get.put(AppInfoController());
  var colorItems = [
    ColorItem(const Color(0xff6DC8F3), const Color(0xff73A1F9)),
    ColorItem(const Color(0xffFF5B95), const Color(0xffF8556D)),
    ColorItem(const Color(0xffD76EF5), const Color(0xff8F7AFE)),
    ColorItem(const Color(0xff42E695), const Color(0xff3BB2B8)),
  ];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  Get.to(() => AppListPage(title: controller.channelList[0].channel));
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: Configure.screenWidth(context) / 2.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  colorItems[0].startColor,
                                  colorItems[0].endColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: colorItems[0].endColor,
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: const Size(150, 150),
                              painter: CustomCardShapePainter(
                                  24, colorItems[0].startColor, colorItems[0].endColor),
                            )),
                        Positioned.fill(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: controller.channelList[0].channel,
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                              CustomText(
                                  text: controller.channelList[0].count.toString(),
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: _width / 64,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  Get.to(() => AppListPage(title: controller.channelList[1].channel));
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: Configure.screenWidth(context) / 2.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  colorItems[1].startColor,
                                  colorItems[1].endColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: colorItems[1].endColor,
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: const Size(150, 150),
                              painter: CustomCardShapePainter(
                                  24, colorItems[1].startColor, colorItems[1].endColor),
                            )),
                        Positioned.fill(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: controller.channelList[1].channel,
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                              CustomText(
                                  text: controller.channelList[1].count.toString(),
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: _width / 64,
          ),
          Row(
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  Get.to(() => AppListPage(title: controller.channelList[2].channel));
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: Configure.screenWidth(context) / 2.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  colorItems[2].startColor,
                                  colorItems[2].endColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: colorItems[2].endColor,
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: const Size(150, 150),
                              painter: CustomCardShapePainter(
                                  24, colorItems[2].startColor, colorItems[2].endColor),
                            )),
                        Positioned.fill(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: controller.channelList[2].channel,
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                              CustomText(
                                  text: controller.channelList[2].count.toString(),
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: _width / 64,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  Get.to(() => AppListPage(title: controller.channelList[3].channel));
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: Configure.screenWidth(context) / 2.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  colorItems[3].startColor,
                                  colorItems[3].endColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: colorItems[3].endColor,
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: const Size(150, 150),
                              painter: CustomCardShapePainter(
                                  24, colorItems[3].startColor, colorItems[3].endColor),
                            )),
                        Positioned.fill(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: controller.channelList[3].channel,
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                              CustomText(
                                  text: controller.channelList[3].count.toString(),
                                  size: 24,
                                  weight: FontWeight.w300,
                                  color: light),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          AppDownLoadTable(),
        ],
      ),
    );
  }
}
