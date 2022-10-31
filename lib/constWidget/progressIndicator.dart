import 'package:flutter/material.dart';
import 'package:hasnaoui/data/colors.dart';

import 'package:sizer/sizer.dart';


Widget circularProgressModel([Color color = blueColor,double height=7 ] ) => SizedBox(
    height: height.h,
    width: height.h,
    child: Center(
      child: CircularProgressIndicator(
          color: color),
    ));

Widget paginationModel() => Container(
    margin: EdgeInsets.symmetric(vertical: 3.h),
    child: Text(
      "more",
      style: TextStyle(
          color: blueColor, fontSize: 13.sp, fontWeight: FontWeight.w600),
    ));