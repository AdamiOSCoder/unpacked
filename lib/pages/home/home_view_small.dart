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

class HomeViewSmallScreen extends StatelessWidget {
  HomeViewSmallScreen({Key? key}) : super(key: key);

  final AppInfoController controller = Get.put(AppInfoController());

  var colorItems = [
    ColorItem(const Color(0xff6DC8F3), const Color(0xff73A1F9)),
    ColorItem(const Color(0xffFF5B95), const Color(0xffF8556D)),
    ColorItem(const Color(0xffD76EF5), const Color(0xff8F7AFE)),
    ColorItem(const Color(0xff42E695), const Color(0xff3BB2B8)),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
                itemCount: controller.channelList.length + 2,
                itemBuilder: (context, index) {
                  if (index == 4) {
                    return const SizedBox(height: 20);
                  } else if (index == 5) {
                    return AppDownLoadTable();
                    //return Container();
                  } else {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Get.to(() => AppListPage(
                            title: controller.channelList[index].channel));
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Stack(
                            children: [
                              Container(
                                height: 150,
                                width: Configure.screenWidth(context),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        colorItems[index].startColor,
                                        colorItems[index].endColor
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 6),
                                        color: colorItems[index].endColor,
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
                                        24,
                                        colorItems[index].startColor,
                                        colorItems[index].endColor),
                                  )),
                              Positioned.fill(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text: controller
                                            .channelList[index].channel,
                                        size: 24,
                                        weight: FontWeight.w300,
                                        color: light),
                                    CustomText(
                                        text: controller
                                            .channelList[index].count
                                            .toString(),
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
                    );
                  }
                }));
      }
    });
  }
}
