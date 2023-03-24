import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/local_navigator.dart';
import 'package:flutter_web/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: SideMenu()),
          Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: localNavigator(),
              ))
        ],
      ),
    );
  }
}
