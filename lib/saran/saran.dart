import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:santan/config/service/api_service.dart';
import 'package:santan/config/theme/app_color.dart';
import 'package:santan/config/theme/app_dimen.dart';
import 'package:santan/config/theme/app_font.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/models/weather/model.dart';
import 'package:santan/saran/component/saran_button.dart';
import 'package:santan/saran/component/saran_tanaman.dart';

class SaranPage extends StatefulWidget {
  const SaranPage({
    super.key,
  });

  @override
  State<SaranPage> createState() => _SaranPageState();
}

class _SaranPageState extends State<SaranPage> {
  final listTanaman = <Plant>[];
  final saranTanaman = <Plant>[];
  final listWeather = <WeatherModel>[];
  bool prosesHitung = true;
  int peluangHujan = 0;
  int peluangKemarau = 0;

  Future<void> _prosesAmbilTanaman() async {
    final list = await ApiService.getAllPlant();
    listTanaman.clear();
    listTanaman.addAll(list);
  }

  Future<void> _prosesAmbilCuaca() async {
    final list = await ApiService.getWeathers();
    listWeather.clear();
    listWeather.addAll(list);
  }

  Future<void> _prosesHitungSaran() async {
    await _prosesAmbilTanaman();
    await _prosesAmbilCuaca();
    final isKemarau = _isKemarau();
    final filter = isKemarau ? 'dry' : 'rainy';
    saranTanaman.clear();
    saranTanaman.addAll(listTanaman.where((element) {
      return element.season == filter;
    }));
    setState(() {
      prosesHitung = false;
    });
  }

  /*
  berawan = 50% kemarau 50% hujan
  hujan = 100% hujan
  gerimis = 75% hujan 25% kemarau
  cerah = 100% kemarau
   */
  bool _isKemarau() {
    if (listWeather.isEmpty) return true;
    if (peluangKemarau == 0 && peluangHujan == 0) {
      for (var element in listWeather) {
        switch (element.weatherStatus) {
          case 'berawan':
            peluangKemarau += 50;
            peluangHujan += 50;
            break;
          case 'hujan':
            peluangHujan += 100;
            break;
          case 'gerimis':
            peluangKemarau += 25;
            peluangHujan += 75;
            break;
          case 'cerah':
            peluangKemarau += 100;
            break;
          default:
        }
      }
    }
    return peluangKemarau > peluangHujan;
  }

  @override
  void initState() {
    super.initState();
    _prosesHitungSaran();
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
      body: prosesHitung
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimen.w6,
                  ),
                  margin: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 6,
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
                        "Prediksi Cuaca Selama 3 Bulan  : ${_isKemarau() ? 'Kemarau' : 'Hujan'}",
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
                Expanded(
                  child: SaranTanaman(
                    saranTanaman: saranTanaman,
                  ),
                ),
                const SaranButton(),
              ],
            ),
    );
  }
}
