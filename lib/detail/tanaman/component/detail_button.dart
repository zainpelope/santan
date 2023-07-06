
import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/saran/saran.dart';
import 'package:santan/utils/extension/extension.dart';
import 'package:santan/widget/app_button.dart';

class DetailButton extends StatelessWidget {
  const DetailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimen.w18,
              vertical: AppDimen.h6,
            ),
            child: Column(
              children: [
                AppButton(
                  text: 'Saran',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SaranPage(),
                      ),
                    );
                  },
                  warna: AppColor.green,
                  height: 45,
                ),
                5.0.height,
                AppButton(
                  text: 'Kembali',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  warna: AppColor.button,
                  height: 45,
                ),
              ],
            ),
          );
  }
}