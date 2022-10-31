import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

void snackBarModel(String title,String message, bool isError) {
  Get.snackbar(
    title,
    message,
    titleText: Text(title,style: TextStyle(fontSize: 12.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    messageText:  Text(message,style: TextStyle(fontSize: 12.sp,color: Colors.white,fontWeight: FontWeight.w500),),
    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
    margin: EdgeInsets.all(15.sp),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    colorText: Colors.white,
    backgroundColor:  isError ? Colors.red : Colors.green,
    icon: Icon(isError ?Icons.warning  : Icons.done, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
  );
}