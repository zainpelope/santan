import 'package:santan/config/service/api_service.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/models/weather/model.dart';

class SaranData {
  final List<Plant> listTanaman = [];
  final List<Plant> saranTanaman = [];
  final List<WeatherModel> listWeather = [];
  bool prosesHitung = true;
  int peluangHujan = 0;
  int peluangKemarau = 0;

  Future<void> prosesAmbilTanaman() async {
    final list = await ApiService.getAllPlant();
    listTanaman.clear();
    listTanaman.addAll(list);
  }

  Future<void> prosesAmbilCuaca() async {
    final list = await ApiService.getWeathers();
    listWeather.clear();
    listWeather.addAll(list);
  }

  Future<void> prosesHitungSaran() async {
    await prosesAmbilTanaman();
    await prosesAmbilCuaca();
    final kemarau = isKemarau();
    final filter = kemarau ? 'dry' : 'rainy';
    saranTanaman.clear();
    saranTanaman.addAll(listTanaman.where((element) {
      return element.season == filter;
    }));
    prosesHitung = false;
  }

  /*
  berawan = 50% kemarau 50% hujan
  hujan = 100% hujan
  gerimis = 75% hujan 25% kemarau
  cerah = 100% kemarau
   */
  bool isKemarau() {
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
}
