import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/model/api_cuaca.dart';
import 'package:santan/model/model_cuaca.dart';
import 'package:santan/saran/component/saran_button.dart';
import 'package:santan/saran/component/saran_tanaman.dart';

class SaranPage extends StatefulWidget {
  final String city;
  const SaranPage({super.key, required this.city});

  @override
  State<SaranPage> createState() => _SaranPageState();
}

class _SaranPageState extends State<SaranPage> {
  late Future<List<ModelCuaca>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = ApiCuaca().fetchWeatherData(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: AppColor.green,
        centerTitle: true,
        title: Text(
          'SARAN',
          style: AppFont.judul,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<List<ModelCuaca>>(
            future: _weatherData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final todayWeather = snapshot.data!.firstWhere(
                  (weather) => _isToday(weather.time),
                  orElse: () => ModelCuaca.empty(),
                );

                if (todayWeather != null) {
                  final formattedDate = DateFormat('EEEE, dd MMMM yyyy')
                      .format(todayWeather.time);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          AppDimen.h12,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: AppDimen.w16,
                          vertical: AppDimen.h8,
                        ),
                        height: 120.0.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                          color: AppColor.hari,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hari",
                                    style: AppFont.judul,
                                  ),
                                  Text(
                                    "Tanggal",
                                    style: AppFont.judul,
                                  ),
                                  Text(
                                    "Cuaca",
                                    style: AppFont.judul,
                                  ),

                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ": ${todayWeather.day}",
                                    style: AppFont.judul,
                                  ),
                                  Text(
                                    ": ${todayWeather.date}",
                                    style: AppFont.judul,
                                  ),
                                  Text(
                                    ": ${todayWeather.getWeatherDescription()}",
                                    style: AppFont.judul,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimen.w6,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: AppDimen.h14,
                        ),
                        height: 50.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.button,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Prediksi Cuaca Selama 3 Bulan : ${todayWeather.description}",
                              style: AppFont.lihat.copyWith(
                                color: AppColor.teks,
                              ),
                            ),
                            Text(
                              "Maka disarankan Untuk Menanam",
                              style: AppFont.lihat.copyWith(
                                color: AppColor.teks,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      'Periksa Koneksi Anda!',
                      style: AppFont.hari.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return const Text(
                  '',
                );
              } else {
                return const CircularProgressIndicator(
                  color: AppColor.hari,
                );
              }
            },
          ),
          const Expanded(
            child: SaranTanaman(),
          ),
          const SaranButton(),
        ],
      ),
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
