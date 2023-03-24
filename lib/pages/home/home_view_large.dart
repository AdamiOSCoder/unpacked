import 'package:flutter_web/bean/channels_info.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/pages/applist/applist_page.dart';
import 'package:flutter_web/pages/login/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configure/configure.dart';
import '../../constants/styles.dart';
import '../../controllers/app_info_controller.dart';
import '../../widgets/custom_text.dart';
import '../setting/page/widget/custom_painter.dart';
import 'package:get_storage/get_storage.dart';

class HomeViewLargeScreen extends StatelessWidget {
  HomeViewLargeScreen({Key? key}) : super(key: key);

  final AppInfoController controller = Get.put(AppInfoController());

  var colorItems = [
    ColorItem(const Color(0xff6DC8F3), const Color(0xff73A1F9)),
    ColorItem(const Color(0xffFF5B95), const Color(0xffF8556D)),
    ColorItem(const Color(0xffD76EF5), const Color(0xff8F7AFE)),
    ColorItem(const Color(0xff42E695), const Color(0xff3BB2B8)),
  ];

  get context => null;

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    // return Column(
    //   children: [
    //     Row(
    //       children: [
    //         Expanded(
    //           child: InkWell(
    //             hoverColor: Colors.transparent,
    //             onTap: () {
    //               Get.to(() =>  AppListPage(title: items[0].area));
    //             },
    //             child: Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8),
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       height: 150,
    //                       //width: Configure.screenWidth(context) / 2.5,
    //                       decoration: BoxDecoration(
    //                         gradient: LinearGradient(
    //                             colors: [
    //                               items[0].startColor,
    //                               items[0].endColor
    //                             ],
    //                             begin: Alignment.topLeft,
    //                             end: Alignment.bottomRight),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               offset: const Offset(0, 6),
    //                               color: items[0].endColor,
    //                               blurRadius: 12)
    //                         ],
    //                         borderRadius: BorderRadius.circular(24),
    //                       ),
    //                     ),
    //                     Positioned(
    //                         right: 0,
    //                         bottom: 0,
    //                         top: 0,
    //                         child: CustomPaint(
    //                           size: const Size(150, 150),
    //                           painter: CustomCardShapePainter(
    //                               24, items[0].startColor, items[0].endColor),
    //                         )),
    //                     Positioned.fill(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           CustomText(
    //                               text: items[0].area,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                           CustomText(
    //                               text: items[0].account,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           width: 5,
    //         ),
    //         Expanded(
    //           child: InkWell(
    //             hoverColor: Colors.transparent,
    //             onTap: () {
    //               Get.to(() =>  AppListPage(title: items[1].area));
    //             },
    //             child: Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8),
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       height: 150,
    //                       decoration: BoxDecoration(
    //                         gradient: LinearGradient(
    //                             colors: [
    //                               items[1].startColor,
    //                               items[1].endColor
    //                             ],
    //                             begin: Alignment.topLeft,
    //                             end: Alignment.bottomRight),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               offset: const Offset(0, 6),
    //                               color: items[1].endColor,
    //                               blurRadius: 12)
    //                         ],
    //                         borderRadius: BorderRadius.circular(24),
    //                       ),
    //                     ),
    //                     Positioned(
    //                         right: 0,
    //                         bottom: 0,
    //                         top: 0,
    //                         child: CustomPaint(
    //                           size: const Size(150, 150),
    //                           painter: CustomCardShapePainter(
    //                               24, items[1].startColor, items[1].endColor),
    //                         )),
    //                     Positioned.fill(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           CustomText(
    //                               text: items[1].area,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                           CustomText(
    //                               text: items[1].account,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           width: 5,
    //         ),
    //         Expanded(
    //           child: InkWell(
    //             hoverColor: Colors.transparent,
    //             onTap: () {
    //               Get.to(() =>  AppListPage(title: items[2].area));
    //             },
    //             child: Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8),
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       height: 150,
    //                       decoration: BoxDecoration(
    //                         gradient: LinearGradient(
    //                             colors: [
    //                               items[2].startColor,
    //                               items[2].endColor
    //                             ],
    //                             begin: Alignment.topLeft,
    //                             end: Alignment.bottomRight),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               offset: const Offset(0, 6),
    //                               color: items[2].endColor,
    //                               blurRadius: 12)
    //                         ],
    //                         borderRadius: BorderRadius.circular(24),
    //                       ),
    //                     ),
    //                     Positioned(
    //                         right: 0,
    //                         bottom: 0,
    //                         top: 0,
    //                         child: CustomPaint(
    //                           size: const Size(150, 150),
    //                           painter: CustomCardShapePainter(
    //                               24, items[2].startColor, items[2].endColor),
    //                         )),
    //                     Positioned.fill(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           CustomText(
    //                               text: items[2].area,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                           CustomText(
    //                               text: items[2].account,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           width: 5,
    //         ),
    //         Expanded(
    //           child: InkWell(
    //             hoverColor: Colors.transparent,
    //             onTap: () {
    //               Get.to(() =>  AppListPage(title: items[3].area));
    //             },
    //             child: Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8),
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       height: 150,
    //                       //width: Configure.screenWidth(context) / 2.5,
    //                       decoration: BoxDecoration(
    //                         gradient: LinearGradient(
    //                             colors: [
    //                               items[3].startColor,
    //                               items[3].endColor
    //                             ],
    //                             begin: Alignment.topLeft,
    //                             end: Alignment.bottomRight),
    //                         boxShadow: [
    //                           BoxShadow(
    //                               offset: const Offset(0, 6),
    //                               color: items[3].endColor,
    //                               blurRadius: 12)
    //                         ],
    //                         borderRadius: BorderRadius.circular(24),
    //                       ),
    //                     ),
    //                     Positioned(
    //                         right: 0,
    //                         bottom: 0,
    //                         top: 0,
    //                         child: CustomPaint(
    //                           size: const Size(150, 150),
    //                           painter: CustomCardShapePainter(
    //                               24, items[3].startColor, items[3].endColor),
    //                         )),
    //                     Positioned.fill(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           CustomText(
    //                               text: items[3].area,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                           CustomText(
    //                               text: items[3].account,
    //                               size: 24,
    //                               weight: FontWeight.w300,
    //                               color: light),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     const SizedBox(height: 20),
    //     const AppDownLoadTable(),
    //   ],
    // );
    return SizedBox(
        height: 200,
        child: Obx(() {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.channelList.length,
            itemBuilder: (BuildContext context, int index) {
              return channelItem(context, index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 5,
              );
            },
          );
        }));
  }

  Widget channelItem(BuildContext context, int index) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        channelListInfo(controller.channelList[index].channel);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Container(
                height: 150,
                width: Configure.screenWidth(context) / 5.3,
                //width: 270,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    colorItems[index].startColor,
                    colorItems[index].endColor
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
                        text: controller.channelList[index].channel,
                        size: 24,
                        weight: FontWeight.w300,
                        color: light),
                    CustomText(
                        text: controller.channelList[index].count.toString(),
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

  goToAppListPage(String title, bool isLogin) {
    //判断是否登录，登录跳转list，没登录先登录
    if (isLogin) {
      Get.to(() => AppListPage(title: title));
      //Get.to( AuthenticationPage());
    } else {
      Get.to(() => AuthenticationPage());
    }
  }

  void channelListInfo(String title) async {
    controller.fetchAppInfo(title);
    Get.to(() => AppListPage(title: title),
        duration: const Duration(seconds: 1),
        transition: Transition.fadeIn);
  }
}
