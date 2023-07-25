import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';

class PlantSearchForm extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final VoidCallback onClearPressed;

  const PlantSearchForm({super.key,
    required this.hintText,
    required this.onChanged,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.hari,
        hintText: hintText,
        hintStyle: AppFont.pencarian,

        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
    );
  }
}
