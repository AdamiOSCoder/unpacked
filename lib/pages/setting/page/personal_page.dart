import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../configure/configure.dart';
import '../../../constants/styles.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

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
            child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 20),
          width: Configure.screenWidth(context),
          decoration: BoxDecoration(
            //color: Colors.green,
            //border: Border.all(color: active.withOpacity(.4), width: .5),
            // border: Border(
            //     left: BorderSide(color: active.withOpacity(.4), width: .5),
            //     top: BorderSide(color: active.withOpacity(.4), width: .5)),
            // boxShadow: [
            //   BoxShadow(
            //       offset: const Offset(0, 6),
            //       color: lightGrey.withOpacity(.1),
            //       blurRadius: 12)
            // ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Container(
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? Configure.screenWidth(context)
                      : 500,
                  height: ResponsiveWidget.isSmallScreen(context) ? 230 : 300,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      gradient: LinearGradient(
                          colors: [blue2, blue1],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                            blurRadius: 4.0,
                            offset: Offset(-4, -4),
                            color: Colors.white24),
                        BoxShadow(
                            blurRadius: 6.0,
                            offset: const Offset(8, 8),
                            color: Colors.black.withOpacity(.5))
                      ]),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          "账号",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        subtitle: Text(
                          "764568929@qq.com",
                          style: TextStyle(
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 18
                                : 25,
                            fontWeight: FontWeight.bold,
                            //fontStyle: FontStyle.italic
                          ),
                        ),
                        leading: const Icon(Icons.account_box,
                            size: 50, color: Colors.yellow),
                        textColor: Colors.white,
                        // trailing: Icon(Icons.more_vert,
                        //     size: 30, color: Colors.yellow),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       ListTile(
                        title: const Text(
                          "剩余下载次数",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        subtitle: Text(
                          "10次",
                          style: TextStyle(
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 18
                                  : 25,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: const Icon(Icons.account_balance_wallet,
                            size: 50, color: Colors.yellow),
                        textColor: Colors.white,
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   children: [
                      //     const Text(""),
                      //     const Spacer(),
                      //     InkWell(
                      //       child: Row(
                      //         children: [
                      //           const Text("退出",
                      //               style: TextStyle(
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.normal,
                      //                   color: Colors.white)),
                      //           const SizedBox(
                      //             width: 10,
                      //           ),
                      //           IconButton(
                      //               onPressed: () {
                      //               },
                      //               icon: const Icon(Icons.logout,
                      //                   size: 40, color: Colors.yellow))
                      //         ],
                      //       ),
                      //     )
                      //
                      //     // ListTile(
                      //     //   title: Text(
                      //     //     "退出",
                      //     //     style: TextStyle(
                      //     //         fontSize: 30, fontWeight: FontWeight.normal),
                      //     //   ),
                      //     //   leading: Icon(Icons.logout,
                      //     //       size: 50, color: Colors.yellow),
                      //     //   textColor: Colors.white,
                      //     // )
                      //   ],
                      // )
                    ],
                  ))
            ],
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: const [
          //         CustomText(
          //           text: "欢迎来到UnPack App,请按照以下步骤进行使用",
          //           size: 20,
          //         ),
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //   ],
          // ),
        ))
      ],
    );
  }
}
