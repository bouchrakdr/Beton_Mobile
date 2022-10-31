import 'package:flutter/material.dart';
import 'package:hasnaoui/Controller/controller.bottomBar.dart';
import 'package:hasnaoui/data/colors.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';


Widget bottomBarItem(IconData icon, int index) {
  final controller = Get.find<BottomBarController>();
  bool selected = controller.isSelected(index);
  return InkWell(
    onTap: (){
      controller.updateSelected(index);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      width: 17.w,
      height: double.infinity,
      child: Icon(icon , color: selected ? greenColor : Colors.grey,size: 20.sp,)
    ),
  );
}