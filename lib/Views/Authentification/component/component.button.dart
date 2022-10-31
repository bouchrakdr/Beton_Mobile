import 'package:flutter/material.dart';
import 'package:hasnaoui/data/colors.dart';

import 'package:sizer/sizer.dart';

Widget buttonModel(String title, VoidCallback? function,[Color color= greenColor]) => SizedBox(
  width: double.infinity,
  height: 7.h,
  child:   TextButton(
    onPressed: function,
    style:
    TextButton.styleFrom(
      shape:RoundedRectangleBorder( // <--- use this
        borderRadius: BorderRadius.all(
          Radius.circular(6.sp),
        ),
      ),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: Text(
      title,
      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 13.sp),
    ),
  ),
);