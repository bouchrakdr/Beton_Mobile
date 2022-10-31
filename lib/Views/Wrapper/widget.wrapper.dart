import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasnaoui/Controller/wrapperOnBoardingController.dart';
import 'package:hasnaoui/Views/Authentification/widget.logIn.dart';
import 'package:hasnaoui/Views/ButtomBar/widget.ButtomBar.dart';
import 'package:hasnaoui/constWidget/progressIndicator.dart';

class WrapperWidget extends StatefulWidget {
  const WrapperWidget({Key? key}) : super(key: key);

  @override
  _WrapperWidgetState createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(WrapperOnBoardingController());
    return GetBuilder(
        init: controller,
        builder: (context) {
          return controller.isUpdating
              ? circularProgressModel()
              : controller.first
                  ? LogInWidget()
                  : BottomBarWidget();
        });
  }
}
