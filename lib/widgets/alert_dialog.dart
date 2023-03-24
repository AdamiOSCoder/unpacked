import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;

  const MyAlertDialog({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? "提示"),
      content: Text(content!),
      actions: [
        CupertinoDialogAction(
          child: const Text("确定"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // TextButton(
        //   onPressed: () => Navigator.pop(context, '确定'),
        //   child: const Text('确定'),
        // ),
        //CupertinoDialogAction(child: Text("取消")),
      ],
      elevation: 24,
      //backgroundColor: Colors.yellow,
    );
  }
}
