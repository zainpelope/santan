import 'dart:convert';
import '../model/model_cuaca.dart';
import 'package:http/http.dart' as http;

class ApiCuaca {
  Future<List<ModelCuaca>> fetchWeatherData(String city) async {
    const apiKey = '8a178ac877f0f6966ae8407f60c858b6';
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city,Kecamatan%20Palengaan&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> weatherList = jsonData['list'];

      final List<ModelCuaca> hourlyWeatherList = [];
      for (int i = 0; i < weatherList.length; i++) {
        final weatherJson = weatherList[i];
        final weather = ModelCuaca.fromJson(weatherJson);
        hourlyWeatherList.add(weather);
      }
      return hourlyWeatherList;
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}
