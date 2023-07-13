import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/detail/cuaca/detail_cuaca.dart';
import 'package:santan/model/api_cuaca.dart';
import 'package:santan/model/model_cuaca.dart';
import 'package:santan/utils/extension/extension.dart';


class CuacaPage extends StatefulWidget {
  const CuacaPage({Key? key}) : super(key: key);

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
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
    return Container(
      height: 400.0.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.hari,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: AppDimen.w8,
                  left: AppDimen.h8,
                ),
                padding: EdgeInsets.only(
                  left: AppDimen.w14,
                ),
                height: 45.0.h,
                width: 220.0.w,
                decoration: BoxDecoration(
                  color: AppColor.bg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Cuaca Hari Ini",
                        style: AppFont.judul,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("sya ditekan");
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: AppDimen.w8,
                    right: AppDimen.h8,
                  ),
                  height: 45.0.h,
                  width: 160.0.w,
                  decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${DateFormat.EEEE('id_ID').format(DateTime.now())}, ',
                          style: AppFont.pencarian,
                        ),
                        Text(
                          DateFormat('d MMMM yyyy', 'id_ID')
                              .format(DateTime.now()),
                          style: AppFont.pencarian,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          3.0.height,
          Expanded(
            child: FutureBuilder<List<ModelCuaca>>(
              future: weatherData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<ModelCuaca> weatherList = snapshot.data!;
                  return ListView.builder(
                    itemCount: weatherList.length > 7 ? 7 : weatherList.length,
                    itemBuilder: (context, index) {
                      final ModelCuaca weather = weatherList[index];
                      final dayOfWeek = DateFormat('EEEE', 'id_ID').format(
                        DateTime.now().add(
                          Duration(days: index),
                        ),
                      );
                      final date = DateFormat('dd MMMM yyyy', 'id_ID').format(
                        DateTime.now().add(
                          Duration(days: index),
                        ),
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailCuaca(
                                weather: weather,
                                dayOfWeek: dayOfWeek,
                                date: date,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: AppDimen.w8,
                            right: AppDimen.w8,
                            bottom: AppDimen.h4,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.bg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              trailing: Image.network(
                                'https://openweathermap.org/img/w/${weather.weatherIcon}.png',
                              ),
                              title: Text(
                                '${weather.temperature.toStringAsFixed(0)}°C',
                                style: AppFont.hari,
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                weather.getWeatherDescription(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColor.search,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              leading: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dayOfWeek,
                                    style: AppFont.hari,
                                  ),
                                  4.0.height,
                                  Text(
                                    date,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColor.search,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                return const CircularProgressIndicator(
                  color: AppColor.green,
                );
              },
            ),
          ),
          8.0.height,
        ],
      ),
    );
  }
}
