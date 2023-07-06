import 'package:flutter/material.dart';

import '../config/theme/app_font.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.warna,
      required this.height})
      : super(key: key);
  final String text;
  final Color warna;
  final double height;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: warna,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
        child: Text(
          text,
          style: AppFont.judul,
        ),
      ),
    );
  }
}
