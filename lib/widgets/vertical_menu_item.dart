import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/controllers.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';

class VerticalMenuItem extends StatelessWidget {
  final String? itemName;
  final VoidCallback onTap;

  const VerticalMenuItem({Key? key, this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName!)
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName!)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName!) ||
                      menuController.isActive(itemName!),
                  child: Container(
                    width: 3,
                    height: 72,
                    color: Colors.white,
                  ),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),
                Expanded(
                    child: Container(
                        child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: menuController.returnIconFor(itemName!),
                    ),
                    if (!menuController.isActive(itemName!))
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName!)
                            ? dark
                            : lightGrey,
                      ))
                    else
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: dark,
                        size: 18,
                        weight: FontWeight.bold,
                      ))
                  ],
                ))),
              ],
            ),
          )),
    );
  }
}
