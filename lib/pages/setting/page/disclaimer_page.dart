import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../bean/channels_info.dart';
import '../../../configure/configure.dart';

class DisclaimerPage extends StatelessWidget {
  DisclaimerPage({Key? key}) : super(key: key);
  var colorItems = [
    ColorItem(const Color(0xff6DC8F3), const Color(0xff73A1F9)),
    ColorItem(const Color(0xffFF5B95), const Color(0xffF8556D)),
    ColorItem(const Color(0xffD76EF5), const Color(0xff8F7AFE)),
    ColorItem(const Color(0xff42E695), const Color(0xff3BB2B8)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 20),
            width: Configure.screenWidth(context),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   border: Border.all(color: active.withOpacity(.4), width: .5),
            //   boxShadow: [
            //     BoxShadow(
            //         offset: const Offset(0, 6),
            //         color: lightGrey.withOpacity(.1),
            //         blurRadius: 12)
            //   ],
            //   borderRadius: BorderRadius.circular(8),
            // ),
            // child: ListView.builder(
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return Center(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8),
            //           child: Stack(
            //             children: [
            //               Container(
            //                 height: 200,
            //                 width: 500,
            //                 decoration: BoxDecoration(
            //                   gradient: LinearGradient(
            //                       colors: [
            //                         items[index].startColor,
            //                         items[index].endColor
            //                       ],
            //                       begin: Alignment.topLeft,
            //                       end: Alignment.bottomRight),
            //                   boxShadow: [
            //                     BoxShadow(
            //                         offset: const Offset(0, 6),
            //                         color: items[index].endColor,
            //                         blurRadius: 12)
            //                   ],
            //                   borderRadius: BorderRadius.circular(24),
            //                 ),
            //               ),
            //               Positioned(
            //                   right: 0,
            //                   bottom: 0,
            //                   top: 0,
            //                   child: CustomPaint(
            //                     size: const Size(150, 150),
            //                     painter: CustomCardShapePainter(
            //                         24,
            //                         items[index].startColor,
            //                         items[index].endColor),
            //                   )),
            //               Positioned.fill(
            //                 child: Row(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     const Expanded(
            //                       flex: 2,
            //                       child: Icon(
            //                         Icons.account_circle,
            //                         size: 50,
            //                       ),
            //                     ),
            //                     Expanded(
            //                       flex: 4,
            //                       child: Column(
            //                         mainAxisSize: MainAxisSize.min,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: const [
            //                           Text(
            //                             "some title text",
            //                             style: TextStyle(
            //                                 color: Colors.white,
            //                                 fontFamily: 'Avenir',
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                           Text(
            //                             "some title text",
            //                             style: TextStyle(
            //                                 color: Colors.white,
            //                                 fontFamily: 'Avenir',
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                           Text(
            //                             "some title text",
            //                             style: TextStyle(
            //                                 color: Colors.white,
            //                                 fontFamily: 'Avenir',
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     Expanded(
            //                         flex: 2,
            //                         child: Column(
            //                           mainAxisSize: MainAxisSize.min,
            //                           children: const [
            //                             Text(
            //                               "4.7",
            //                               style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontFamily: 'Avenir',
            //                                   fontWeight: FontWeight.w500),
            //                             ),
            //                             Icon(
            //                               Icons.star,
            //                               color: Colors.white,
            //                             )
            //                           ],
            //                         ))
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     })
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            const BoxShadow(
                                blurRadius: 4.0,
                                offset: Offset(-4, -4),
                                color: Colors.white24),
                            BoxShadow(
                                blurRadius: 6.0,
                                offset: const Offset(6, 6),
                                color: Colors.black.withOpacity(.5))
                          ]),
                      child: Column(
                        children: [
                          Image.asset("assets/icons/logo.png"),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: "UnPacked App",
                            size: 11,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const CustomText(
                            text: "版本1.0.0",
                            size: 11,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomText(
                      text: "免责声明",
                      size: 23,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "1.本网站提供的内容仅供个人学习,研究为目的,请合法使用本网站提供的内容.\n\n"
                      "2.禁止将本网站的服务用作非法用途以及非正当用途.\n\n"
                      "3.本网站的内容仅供参考使用,对于访问者根据本网站提供的内容所做出的一切行为,本网站不承担任何形式的责任.",
                  size: 18,
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
