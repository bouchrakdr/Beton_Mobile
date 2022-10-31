import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hasnaoui/Service/service.auth.dart';
import 'package:hasnaoui/Views/ButtomBar/widget.ButtomBar.dart';
import 'package:hasnaoui/constWidget/snackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var isUpdating = false.obs;

  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }

  String? validateUserName(String? email) {
    if (userNameController.text.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (validateUserName("") == null) {
      if (passwordController.text.isEmpty) {
        return "Password is required";
      }
      return null;
    }
    return null;
  }

  login() async {
    if (formKey.currentState?.validate() ?? true) {
      switchBool();
      var response = await AuthService.logIn(
          userNameController.text, passwordController.text);
      if (response.error) {
        snackBarModel("echec".tr, "check your informations", true);
      } else {
        Get.to(() => const BottomBarWidget());
      }
      switchBool();
    }
  }
}
