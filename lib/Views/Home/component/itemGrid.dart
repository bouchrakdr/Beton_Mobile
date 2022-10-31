import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget itemGrid(String mtr, int tst, int notst) => Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              mtr,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Text('testé : $tst',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600,color: Colors.grey)),
            ),
            Text('non testé : $notst',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600,color: Colors.grey)),
          ],
        ),
      ),
    );
