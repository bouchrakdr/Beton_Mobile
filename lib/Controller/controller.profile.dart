import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hasnaoui/Model/model.user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late TextEditingController lastNameController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  String picture = "";

  var isUpdating = false;

  void switchBool() {
    isUpdating= !isUpdating;
    update();
  }


  getProfile() async {
    switchBool();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var local = preferences.getString('user') ?? "";
    var jsonData = jsonDecode(local);

    UserModel user = UserModel.fromJson(jsonData);
    lastNameController = TextEditingController(text: user.prenom);
    nameController = TextEditingController(text: user.nom);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.numero);
    switchBool();
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  late File imageFile;
  bool imageFromNetwork = true;

  void takePick() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      imageFromNetwork = false;
      update();
    }
  }

  String? validateName(String? name) {
    if (nameController.text.isEmpty) {
      return "name_req".tr;
    }

    if (nameController.text.length < 3 ||
        !RegExp(r'^[a-zA-Z]+$').hasMatch(nameController.text)) {
      return "name_valid".tr;
    }
    return null;
  }

  String? validateLastName(String? email) {
    if (validateName("") == null) {
      if (lastNameController.text.isEmpty) {
        return "last_name_req".tr;
      }

      if (lastNameController.text.length < 3 ||
          !RegExp(r'^[a-zA-Z]+$').hasMatch(lastNameController.text)) {
        return "last_name_valid".tr;
      }
    }
    return null;
  }

  String? validatePhoneNumber(String? date) {
    if (validateName("") == null && (validateLastName("")) == null) {
      if (phoneNumberController.text.isEmpty) {
        return "phone_num".tr;
      }
      if (phoneNumberController.text.length != 10 ||
          phoneNumberController.text[0] != "0" ||
          !RegExp(r'^[0-9]+$').hasMatch(phoneNumberController.text)) {
        return "phone_num_valid".tr;
      }
    }
    return null;
  }

  String? validateEmail(String? email) {
    return null;
  }
}
