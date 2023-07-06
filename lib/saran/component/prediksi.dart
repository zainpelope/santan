import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/data/model/cuaca.dart';


class SaranPrediksi extends StatefulWidget {
  const SaranPrediksi({Key? key}) : super(key: key);

  @override
  State<SaranPrediksi> createState() => _SaranPrediksiState();
}

class _SaranPrediksiState extends State<SaranPrediksi> {
  final DateTime dateNow = DateTime.now();

  String _getDateString() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE, dd MMM yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    int week = Weather.hari
        .indexOf(Weather.hari[dateNow.weekday - 1]); // indeks hari saat ini
    List<String> hariOrdered = Weather.hari.sublist(week) +
        Weather.hari.sublist(
          0,
          week,
        );
    return Container(
      padding: EdgeInsets.all(
        AppDimen.h12,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: AppDimen.w16,
        vertical: AppDimen.h8,
      ),
      height: 110.0.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: AppColor.hari,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hari        : ${Weather.hari[DateTime.now().weekday - 1]}",
            style: AppFont.judul,
          ),
          Text(
            "Tanggal : ${DateFormat('dd MMMM yyyy').format(
              DateTime.now(),
            )}",
            style: AppFont.judul,
          ),
          Text(
            "Cuaca    : ${Weather.cuaca[3]}",
            style: AppFont.judul,
          ),

        ],
      ),
    );
  }
}
