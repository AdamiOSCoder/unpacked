import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/routing/routeConfig.dart';
import 'package:get/get.dart';

class MenusController extends GetxController {
  static MenusController instance = Get.find();
  var activeItem = RouteConfig.homePageDisplayName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
   switch (itemName) {
     case RouteConfig.homePageDisplayName:
       return _customIcon(Icons.home, itemName);
     case RouteConfig.helpPageDisplayName:
       return _customIcon(Icons.school, itemName);
     case RouteConfig.authenticationPageDisplayName:
       return _customIcon(Icons.logout, itemName);
     case RouteConfig.personalName:
       return _customIcon(Icons.perm_identity, itemName);
     case RouteConfig.rechargeName:
       return _customIcon(Icons.paid, itemName);
     case RouteConfig.aboutMeName:
       return _customIcon(Icons.contact_mail, itemName);
     case RouteConfig.disclaimerName:
       return _customIcon(Icons.notification_important, itemName);
     default:
       return _customIcon(Icons.logout, itemName);
   }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    }
    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
