import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/home/home.dart';
import 'package:santan/widget/app_button.dart';

class SaranButton extends StatelessWidget {
  const SaranButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimen.w20,
        vertical: AppDimen.h4,
      ),
      child: AppButton(
        text: 'Beranda',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        warna: AppColor.green,
        height: 50,
      ),
    );
  }
}
