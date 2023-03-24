import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/configure/configure.dart';
import 'package:flutter_web/constants/styles.dart';
import 'package:flutter_web/http/http_repository.dart';
import 'package:flutter_web/pages/register/register.dart';
import 'package:flutter_web/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../bean/user_info.dart';
import '../../http/http_url.dart';
import '../../response/response_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _isObscure = true.obs;
  Color _eyeColor = Colors.grey;
  final _formKey = GlobalKey<FormState>();
  final _userName = "".obs;
  final _password = "".obs;

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  Text("登录",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomText(
                    size: 20,
                    text: "欢迎来到 UnPacked App",
                    color: lightGrey,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     CustomText(
              //       text: "欢迎来到 Reverse App",
              //       color: lightGrey,
              //     )
              //   ],
              // ),
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
                _eyeColor = (_isObscure.value
                    ? Colors.grey
                    : Theme.of(context).iconTheme.color)!;
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure.value,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "请输入密码";
                    }
                    return null;
                  },
                  //onSaved: (String? value) =>  = value!,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye),
                        color: _eyeColor,
                        onPressed: () {
                          _isObscure.value = !_isObscure.value;
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Checkbox(value: true, onChanged: (value) {}),
              //         const CustomText(
              //           text: "Remeber Me",
              //         ),
              //       ],
              //     ),
              //     CustomText(text: "Forgot password?", color: active)
              //   ],
              // ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      var data = await Get.to(() => RegisterPage(),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fadeIn);
                    },
                    child: const CustomText(
                      text: "没有账号？点击注册",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  validateAndSave(
                      _emailController.text, _passwordController.text, context);
                  //Get.offAllNamed(rootRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: active, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const CustomText(
                    text: "登录",
                    color: Colors.white,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // RichText(
              //     text: TextSpan(children: [
              //       const TextSpan(text: "Do not have admin credentials? "),
              //       TextSpan(
              //           text: "Request Credentials! ",
              //           style: TextStyle(color: active))
              //     ]))
            ]),
          )),
    )));
  }

//SingleChildScrollView
  void validateAndSave(String userName, String passWord, BuildContext context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      login(userName, passWord, context);
    } else {
      //Get.back();
    }
  }

  login(String userName, String passWord, BuildContext context) async {
    UserInfo userInfo = UserInfo();
    userInfo.username = userName;
    userInfo.password = passWord;
    var response =
        await HttpRepository.login(HttpUrl.loginUrl, userInfo.toJson());
    if (response.toString().isNotEmpty && response != null) {
      ResponseInfo responseInfo = ResponseInfo.fromJson(response);
      if (responseInfo.commonInfo!.result!) {
        Get.back(result: responseInfo.userName);
      } else {
        Configure.showMyDialog(context, "用户名或密码错误", "警告");
      }
    }
  }

// save(String username) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString("myUserName", username);
// }

}
