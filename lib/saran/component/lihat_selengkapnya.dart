import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/saran/component/saran_button.dart';
import '../../config/theme/app_dimen.dart';
import '../../config/theme/app_font.dart';

class LihatSelengkapnya extends StatelessWidget {
  const LihatSelengkapnya({Key? key, required this.DeskripsiTanaman})
      : super(key: key);
  final String DeskripsiTanaman;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alasan Tanaman",
          style: AppFont.judul,
        ),
        centerTitle: true,
        backgroundColor: AppColor.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimen.h6,
                      horizontal: AppDimen.w10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          DeskripsiTanaman,
                          style: AppFont.desc,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SaranButton(),
        ],
      ),
    );
  }
}
