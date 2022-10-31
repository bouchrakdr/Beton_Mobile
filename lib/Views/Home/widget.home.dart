import 'package:flutter/material.dart';
import 'package:hasnaoui/Controller/controller.home.dart';
import 'package:hasnaoui/Views/Home/component/itemGrid.dart';
import 'package:hasnaoui/constWidget/progressIndicator.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    controller.getUser();
    controller.getMatieres();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              "assets/logo.jpg",
              height: 40.sp,
              width: 40.sp,
            ),
            title: Text(
              controller.nameUser,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
          ),
          GetBuilder(
            init: controller,
            builder: (context) {
              return  Expanded(
                child:controller.isUpdating ? Center(child: circularProgressModel()) : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 37.w / 18.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.h,
                      mainAxisSpacing: 2.h),
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                  itemBuilder: (BuildContext context, int index) {
                    return itemGrid(controller.matieres[index].name, controller.matieres[index].tst,
                        controller.matieres[index].notst);
                  },
                  itemCount: 4,
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
