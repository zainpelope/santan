import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/tanaman/component/deskripsi_tanaman.dart';
import 'package:santan/detail/tanaman/component/image_tanaman.dart';
import 'tanaman/component/detail_button.dart';

class DetailTanaman extends StatelessWidget {
  final String NamaTanaman;
  final String GambarTanaman;
  final String DeskripsiTanaman;
  const DetailTanaman(
      {Key? key,
      required this.NamaTanaman,
      required this.GambarTanaman,
      required this.DeskripsiTanaman})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.green,
        title: Text(
          NamaTanaman,
          style: AppFont.judul,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImageTanaman(
                  GambarTanaman: GambarTanaman,
                ),
                TanamanDeskripsi(
                  DeskripsiTanaman: DeskripsiTanaman,
                ),
              ],
            ),
            const DetailButton(),
          ],
        ),
      ),
    );
  }
}
