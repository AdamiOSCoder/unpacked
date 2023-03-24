import 'package:flutter/cupertino.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/horizontal_menu_item.dart';
import 'package:flutter_web/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String? itemName;
  final VoidCallback? onTap;

  const SideMenuItem({Key? key,this.itemName,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   if (ResponsiveWidget.isCustomScreen(context)) {
     return VerticalMenuItem(onTap: onTap!,itemName: itemName,);
   }
   return HorizontalMenuItem(onTap: onTap!,itemName: itemName,);
  }
}