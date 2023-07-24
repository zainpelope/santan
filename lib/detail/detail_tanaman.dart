import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/tanaman/component/deskripsi_tanaman.dart';
import 'package:santan/detail/tanaman/component/image_tanaman.dart';
import 'tanaman/component/detail_button.dart';

class DetailTanaman extends StatelessWidget {
  final String namePlant;
  final String imagePlant;
  final String descriptionPlant;
  const DetailTanaman(
      {Key? key,
      required this.namePlant,
      required this.imagePlant,
      required this.descriptionPlant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.green,
        title: Text(
          namePlant,
          style: AppFont.judul,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ImageTanaman(
                  imagePlant: imagePlant,
                ),
                TanamanDeskripsi(
                  descriptionPlant: descriptionPlant,
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
