import 'package:flutter/material.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/saran/saran.dart';
import 'package:santan/utils/extension/extension.dart';
import 'package:santan/widget/app_button.dart';
import '../../../model/api_cuaca.dart';
import '../../../model/model_cuaca.dart';

class DetailButton extends StatefulWidget {
  const DetailButton({super.key});

  @override
  State<DetailButton> createState() => _DetailButtonState();
}

class _DetailButtonState extends State<DetailButton> {
  final weatherFetcher = ApiCuaca();
  final city = 'Pamekasan';

  late Future<List<ModelCuaca>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = weatherFetcher.fetchWeatherData(city);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
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
                  builder: (context) =>  const SaranPage(city: 'Pamekasan',),
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
