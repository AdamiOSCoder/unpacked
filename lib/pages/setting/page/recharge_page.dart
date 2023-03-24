import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../configure/configure.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({Key? key}) : super(key: key);

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
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 30),
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
                      text: "充值方法",
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "1.请扫描下方左侧微信二维码进行支付,"
                      "支付完成后请扫描右侧二维码添加网站管理员微信.\n\n"
                      "2.添加成功后发支付成功截图给管理员,"
                      "点击网站左侧「我的」查看账户信息.\n\n",
                  size: 18,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const CustomText(
                          text: "支付二维码",
                          size: 18,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: ResponsiveWidget.isSmallScreen(context)
                              ? 100
                              : 150,
                          height: ResponsiveWidget.isSmallScreen(context)
                              ? 100
                              : 150,
                          child: Image.asset("assets/icons/wechatme.jpeg"),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Column(
                      children: [
                        const CustomText(
                          text: "管理员微信",
                          size: 18,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: ResponsiveWidget.isSmallScreen(context)
                              ? 100
                              : 150,
                          height: ResponsiveWidget.isSmallScreen(context)
                              ? 100
                              : 150,
                          child: Image.asset("assets/icons/wechatme.jpeg"),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
