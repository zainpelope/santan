import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'app_color.dart';

class AppFont {
  static TextStyle get title =>  TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.teks,
  );
  static TextStyle get suhu =>  TextStyle(
    fontSize: 45.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.teks,
  );
  static TextStyle get judul =>  TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.teks,
  );
  static TextStyle get desc =>  TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.teks,
  );
  static TextStyle get  hari =>  TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.teks,
  );
  static TextStyle get pencarian =>  TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.search,
    fontStyle: FontStyle.italic,
  );
  static TextStyle get lihat =>  TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.search,
    fontStyle: FontStyle.italic,
  );
  static TextStyle get form =>  TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
    fontStyle: FontStyle.italic,
  );
}
