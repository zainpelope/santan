import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/model/api_cuaca.dart';
import 'package:santan/model/model_cuaca.dart';
import 'package:santan/utils/extension/extension.dart';

class CuacaHarian extends StatelessWidget {
  const CuacaHarian({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          height: 280.0.h,
          decoration: const BoxDecoration(
            color: AppColor.hari,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                50,
              ),
              topRight: Radius.circular(
                50,
              ),
            ),
          ),
          child: Column(
            children: [
              15.0.height,
              Text(
                "Cuaca Harian",
                style: AppFont.judul,
              ),
              15.0.height,
              Expanded(
                child: FutureBuilder<List<ModelCuaca>>(
                  future: ApiCuaca().fetchWeatherData(city),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final hourlyWeatherList = snapshot.data!;
                      final truncatedList = hourlyWeatherList.take(24).toList();

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: truncatedList.length,
                        itemBuilder: (context, index) {
                          final weather = truncatedList[index];
                          final hour = weather.time.hour;
                          final amPm = hour < 12 ? 'AM' : 'PM';
                          final displayHour = hour % 12 == 0 ? 12 : hour % 12;
                          final formattedHour =
                              displayHour.toString().padLeft(2, '0');
                          final formattedTime = '$formattedHour:00 $amPm';

                          return Container(
                            width: 120.0.w,
                            margin: EdgeInsets.only(
                              right: AppDimen.w4,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColor.bg,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  10,
                                ),
                                topRight: Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  formattedTime,
                                  style: AppFont.hari,
                                ),
                                Text(
                                  '${weather.temperature.toStringAsFixed(0)}°C',
                                  style: AppFont.desc,
                                ),
                                Container(
                                  height: 100.0.h,

                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://openweathermap.org/img/w/${weather.weatherIcon}.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  weather.getWeatherDescription(),
                                  style: AppFont.pencarian,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Periksa Koneksi Anda!',
                          style: AppFont.hari.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
