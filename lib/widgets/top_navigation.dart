import 'dart:ui';

import 'custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/pages/login/authentication.dart';

// AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
//     AppBar(
//       leading: !ResponsiveWidget.isSmallScreen(context)
//           ? Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(left: 14),
//                   child: Image.asset(
//                     "assets/icons/logo.png",
//                     width: 28,
//                   ),
//                 )
//               ],
//             )
//           : IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 key.currentState!.openDrawer();
//               },
//             ),
//       title: Row(
//         children: [
//           Visibility(
//               child: CustomText(
//             text: "UnPacked App",
//             color: dark,
//             size: 20,
//             weight: FontWeight.bold,
//           )),
//           Expanded(child: Container()),
//           // IconButton(
//           //     onPressed: () {
//           //      // Get.to(() => SettingPage());
//           //     },
//           //     icon: Icon(Icons.settings, color: dark.withOpacity(.7))),
//           // Stack(
//           //   children: [
//           //     IconButton(
//           //         onPressed: () {},
//           //         icon: Icon(
//           //           Icons.notifications,
//           //           color: dark.withOpacity(.7),
//           //         )),
//           //     Positioned(
//           //         top: 10,
//           //         right: 10,
//           //         child: Container(
//           //           width: 8,
//           //           height: 8,
//           //           //padding: const EdgeInsets.all(4),
//           //           decoration: BoxDecoration(
//           //             color: Colors.red,
//           //               //border: Border.all(color: light, width: 2),
//           //               borderRadius: BorderRadius.circular(30)),
//           //         ))
//           //   ],
//           // ),
//           // Container(
//           //   width: 1,
//           //   height: 22,
//           //   color: lightGrey,
//           // ),
//           const SizedBox(
//             width: 24,
//           ),
//           CustomText(
//               text:  "请登录",
//               color: lightGrey,
//             ),
//
//           const SizedBox(
//             width: 16,
//           ),
//           InkWell(
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () async {
//               var data = await Get.to(() => AuthenticationPage());
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white38,
//                   borderRadius: BorderRadius.circular(30)),
//               child: Container(
//                 padding: const EdgeInsets.all(2),
//                 margin: const EdgeInsets.all(2),
//                 child: CircleAvatar(
//                   backgroundColor: light,
//                   child: Icon(
//                     Icons.person_outline,
//                     color: dark,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       elevation: 0,
//       iconTheme: IconThemeData(color: dark),
//       backgroundColor: Colors.transparent,
//     );

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> globalKey;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  const TopNavigationBar(this.globalKey);

  // final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _userName = "请登录".obs;

    return AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                globalKey.currentState!.openDrawer();
              },
            ),
      title: Row(
        children: [
          Visibility(
              child: CustomText(
            text: "UnPacked App",
            color: dark,
            size: 20,
            weight: FontWeight.bold,
          )),
          Expanded(child: Container()),
          // IconButton(
          //     onPressed: () {
          //      // Get.to(() => SettingPage());
          //     },
          //     icon: Icon(Icons.settings, color: dark.withOpacity(.7))),
          // Stack(
          //   children: [
          //     IconButton(
          //         onPressed: () {},
          //         icon: Icon(
          //           Icons.notifications,
          //           color: dark.withOpacity(.7),
          //         )),
          //     Positioned(
          //         top: 10,
          //         right: 10,
          //         child: Container(
          //           width: 8,
          //           height: 8,
          //           //padding: const EdgeInsets.all(4),
          //           decoration: BoxDecoration(
          //             color: Colors.red,
          //               //border: Border.all(color: light, width: 2),
          //               borderRadius: BorderRadius.circular(30)),
          //         ))
          //   ],
          // ),
          // Container(
          //   width: 1,
          //   height: 22,
          //   color: lightGrey,
          // ),
          const SizedBox(
            width: 24,
          ),

          Obx(() {
            return CustomText(
              text: _userName.value,
              color: lightGrey,
            );
          }),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () async {
              var data = await Get.to(() => AuthenticationPage(),
                  duration: const Duration(seconds: 1),
                  transition: Transition.fadeIn);
              if (data == null) {
                _userName.value = "请登录";
              } else {
                _userName.value = data;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: light,
                  child: Icon(
                    Icons.person_outline,
                    color: dark,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      elevation: 0,
      iconTheme: IconThemeData(color: dark),
      backgroundColor: Colors.transparent,
    );
  }
}
