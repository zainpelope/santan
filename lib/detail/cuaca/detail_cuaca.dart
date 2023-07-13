import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/detail/cuaca/component/cuaca_harian.dart';
import 'package:santan/model/model_cuaca.dart';
import 'package:santan/utils/extension/extension.dart';
import '../../config/theme/app_dimen.dart';
import '../../config/theme/app_font.dart';

class DetailCuaca extends StatelessWidget {
  final ModelCuaca weather;
  final String dayOfWeek;
  final String date;

  const DetailCuaca({
    super.key,
    required this.weather,
    required this.dayOfWeek,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: Column(
        children: [
          20.0.height,
          Expanded(
            child: Column(
              children: [
                4.0.height,
                Stack(
                  children: [
                    Positioned(
                      left: AppDimen.h4,
                      top: AppDimen.w0,
                      bottom: AppDimen.w0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColor.teks,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$dayOfWeek, $date ',
                            style: AppFont.judul.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 250.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://openweathermap.org/img/w/${weather.weatherIcon}.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  '${weather.temperature.toStringAsFixed(0)}°C',
                  style: AppFont.suhu,
                ),
                Text(
                  weather.getWeatherDescription(),
                  style: AppFont.hari,
                ),
                60.0.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Kelembapan",
                          style: AppFont.hari,
                        ),
                        Text(
                          '${weather.humidity}%',
                          style: AppFont.desc,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Curah Hujan",
                          style: AppFont.hari,
                        ),
                        Text(
                          '${weather.rainfall} mm',
                          style: AppFont.desc,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const CuacaHarian(
            city: 'Pamekasan',
          ),
        ],
      ),
    );
  }
}
