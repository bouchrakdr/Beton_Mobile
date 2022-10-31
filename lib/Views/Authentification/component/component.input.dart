
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasnaoui/data/colors.dart';
import 'package:sizer/sizer.dart';

class InputComponent extends StatelessWidget {
  Icon leadingIcon;
  String hintText;
  TextEditingController textEditingController;
  String? Function(String?) validate;
  InputComponent(
      {required this.leadingIcon,
        required this.textEditingController,
        required this.hintText,required this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hintText=="Password",
      validator: validate,
      cursorColor:greenColor,
      controller: textEditingController,
      style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500,color: greenColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.05.h, horizontal: 0.0),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: leadingIcon,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.sp,
          maxWidth: 50.w,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    );
  }
}
