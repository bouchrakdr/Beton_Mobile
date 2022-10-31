import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasnaoui/Views/DashBoard/widget.dashboard.dart';
import 'package:hasnaoui/Views/Home/widget.home.dart';
import 'package:hasnaoui/Views/Profile/widget.profile.dart';

class BottomBarController extends GetxController {
  int selected = 0;


  List<Widget> widgets = [
    const HomeWidget(),
    const DashboardWidget(),
    const ProfileWidget(),
  ];


  updateSelected(int index) {
    selected = index;
    update();
  }

  bool isSelected(int index) {
    return selected == index;
  }

  Widget currentWidget() {
    return widgets[selected];
  }
}
