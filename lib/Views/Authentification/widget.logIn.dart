import 'package:flutter/material.dart';
import 'package:hasnaoui/Controller/controller.logIn.dart';
import 'package:hasnaoui/Views/Authentification/component/component.button.dart';
import 'package:hasnaoui/Views/Authentification/component/component.input.dart';
import 'package:hasnaoui/constWidget/progressIndicator.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'assets/logo.jpg',
                height: 100.sp,
                width: 100.sp,
              )),
              Expanded(
                child: Column(
                  children: [
                    InputComponent(
                      leadingIcon: const Icon(
                        Icons.person_outline_rounded,
                        color: Color(0xff23378d),
                      ),
                      hintText: 'Username',
                      textEditingController: controller.userNameController,
                      validate: controller.validateUserName,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    InputComponent(
                      leadingIcon: const Icon(
                        Icons.password_outlined,
                        color: Color(0xff23378d),
                      ),
                      hintText: 'Password',
                      textEditingController: controller.passwordController,
                      validate: controller.validatePassword,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Obx(() => controller.isUpdating.value == false
                      ? buttonModel("login", () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await controller.login();
                        })
                      : circularProgressModel()),
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
