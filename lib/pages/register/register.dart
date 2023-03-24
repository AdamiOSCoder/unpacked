import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bean/user_info.dart';
import '../../configure/configure.dart';
import '../../http/http_repository.dart';
import '../../http/http_url.dart';
import '../../response/response_info.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _secondePasswordController =
      TextEditingController();
  final _isObscure1 = true.obs;
  final _isObscure2 = true.obs;
  Color _eyeColor = Colors.grey;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Form(
        key: _formKey,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset("assets/icons/logo.png"),
                ),
                Expanded(child: Container())
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Row(
              children: [
                Text("注册",
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "请输入邮箱";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "请输入邮箱",
                  //hintText: "abc@163.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() {
              _eyeColor = (_isObscure1.value
                  ? Colors.grey
                  : Theme.of(context).iconTheme.color)!;
              return TextFormField(
                controller: _passwordController,
                obscureText: _isObscure1.value,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "请输入密码";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      color: _eyeColor,
                      onPressed: () {
                        _isObscure1.value = !_isObscure1.value;
                      },
                    ),
                    labelText: "请输入密码",
                    //hintText: "********",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              );
            }),
            const SizedBox(
              height: 15,
            ),
            Obx(() {
              _eyeColor = (_isObscure2.value
                  ? Colors.grey
                  : Theme.of(context).iconTheme.color)!;
              return TextFormField(
                controller: _secondePasswordController,
                obscureText: _isObscure2.value,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "请输入确认密码";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      color: _eyeColor,
                      onPressed: () {
                        _isObscure2.value = !_isObscure2.value;
                      },
                    ),
                    labelText: "确认密码",
                    //hintText: "********",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              );
            }),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                //Get.offAllNamed(rootRoute);
                validateAndSave(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: active, borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const CustomText(
                  text: "注册",
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ))),
    );
  }

  void validateAndSave(BuildContext context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      checkUser(context);
    } else {
      // print('Form is invalid');
    }
  }

  void registerUser(String email, String password, String secondPassword,
      BuildContext context) async {
    UserInfo userInfo = UserInfo();
    userInfo.username = email;
    userInfo.password = password;
    userInfo.secondPassword = secondPassword;
    var response =
        await HttpRepository.login(HttpUrl.registerUrl, userInfo.toJson());
    if (response.toString().isNotEmpty && response != null) {
      ResponseInfo responseInfo = ResponseInfo.fromJson(response);
      if (responseInfo.commonInfo!.result!) {
        Get.back(result: responseInfo.userName);
      } else {
        Configure.showMyDialog(
            context, responseInfo.commonInfo!.message!, "警告");
      }
    }
  }

  void checkUser(BuildContext context) async {
    if (_passwordController.text == _secondePasswordController.text) {
      UserInfo userInfo = UserInfo();
      userInfo.username = _emailController.text;
      var response =
      await HttpRepository.login(HttpUrl.checkUser, userInfo.toJson());
      if (response.toString().isNotEmpty && response != null) {
        ResponseInfo responseInfo = ResponseInfo.fromJson(response);
        if (responseInfo.commonInfo!.result!) {
          registerUser(_emailController.text, _passwordController.text,
              _secondePasswordController.text, context);
          //Get.back(result: responseInfo.userName);
        } else {
          Configure.showMyDialog(
              context, responseInfo.commonInfo!.message!, "警告");
        }
      }
    } else {
      Configure.showMyDialog(
          context, "两次输入的密码不一致", "警告");
    }
  }
}
