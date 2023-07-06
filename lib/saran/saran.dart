import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/saran/component/prediksi.dart';
import 'package:santan/saran/component/saran_button.dart';
import 'component/saran_tanaman.dart';

class SaranPage extends StatelessWidget {
  const SaranPage({Key? key}) : super(key: key);

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
        children: const [
          SaranPrediksi(),
          Expanded(
            child: SaranTanaman(),
          ),
          SaranButton(),
        ],
      ),
    );
  }
}
