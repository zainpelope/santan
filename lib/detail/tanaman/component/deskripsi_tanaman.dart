import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_font.dart';
import '../../../config/theme/app_dimen.dart';

class TanamanDeskripsi extends StatelessWidget {
  const TanamanDeskripsi({Key? key, required this.descriptionPlant})
      : super(key: key);
  final String descriptionPlant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppDimen.h10,
      ),
      margin: EdgeInsets.only(
        top: AppDimen.h200,
      ),
      height: 448.0.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.bg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            50,
          ),
          topRight: Radius.circular(
            50,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimen.h6,
                  horizontal: AppDimen.w10,
                ),
                child: Column(
                  children: [
                    Text(
                      descriptionPlant,
                      style: AppFont.kata,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
