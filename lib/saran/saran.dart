import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/model/api_cuaca.dart';
import 'package:santan/model/model_cuaca.dart';
import 'package:santan/saran/component/saran_button.dart';
import 'package:santan/saran/component/saran_tanaman.dart';

class SaranPage extends StatefulWidget {
  const SaranPage({
    super.key,
  });

  @override
  State<SaranPage> createState() => _SaranPageState();
}

class _SaranPageState extends State<SaranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.green,
        centerTitle: true,
        title: Text(
          'SARAN',
          style: AppFont.judul,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimen.w6,
            ),
            margin: const EdgeInsets.only(
              left: 14,
              right: 14,
              top: 6,
            ),
            height: 50.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.button,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Prediksi Cuaca Selama 3 Bulan ",
                  style: AppFont.lihat.copyWith(
                    color: AppColor.teks,
                  ),
                ),
                Text(
                  "Maka disarankan Untuk Menanam",
                  style: AppFont.lihat.copyWith(
                    color: AppColor.teks,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SaranTanaman(),
          ),
          const SaranButton(),
        ],
      ),
    );
  }
}
