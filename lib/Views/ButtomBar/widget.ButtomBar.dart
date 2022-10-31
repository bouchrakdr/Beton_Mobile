import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasnaoui/Controller/controller.bottomBar.dart';
import 'package:hasnaoui/Views/ButtomBar/comonent/itemBottomBar.dart';
import 'package:sizer/sizer.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());
    return SafeArea(

        child: GetBuilder<BottomBarController>(
            init: controller,
            builder: (context) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                body: controller.currentWidget(),
                bottomNavigationBar: Container(
                  margin: EdgeInsets.symmetric(horizontal: 9.w),
                  height: 7.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp),topRight:Radius.circular(15.sp) ,bottomLeft:Radius.circular(6.sp) ,bottomRight:Radius.circular(6.sp) ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      bottomBarItem(Icons.home_rounded, 0),
                      bottomBarItem(Icons.dashboard_customize_rounded, 1),
                      bottomBarItem(Icons.person, 2),
                    ],
                  ),
                ),
              );
            }
        ));
  }
}
