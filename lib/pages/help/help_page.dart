import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/configure/configure.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/pages/help/widgets/help_table.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

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
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomText(
                      text: "请按照以下步骤进行使用",
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "1.先登录",
                  size: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: "点击网站右上角头像图标进行登录,如果没有账号请先注册账号.",
                  size: 17,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "2.App下载",
                  size: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: "登录后返回到网站首页,选择不同的专区下载自己喜欢的App,也可以直接在下载排行榜的列表中直接点击下载按钮进行下载.",
                  size: 17,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "3. * VIP专区为收费App专区",
                  size: 20,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: "网站首页VIP专区为收费App专区,想要下载此专区的App请先充值.",
                  size: 17,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "4.充值规则",
                  size: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: "①\n②",
                  size: 17,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "5.充值方法",
                  size: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomText(
                  text: "点击首页右上角齿轮（⚙）按钮进入充值页面进行充值.",
                  size: 17,
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
