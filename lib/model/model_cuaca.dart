import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ModelCuaca {
  final DateTime time;
  final String description;
  final double temperature;
  final int humidity;
  final String weatherIcon;
  final double rainfall;
  late final String day;
  late final String date;

  ModelCuaca({
    required this.time,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.weatherIcon,
    required this.rainfall,
  }) {
    initializeDateFormatting('id_ID', null);
    day = DateFormat.EEEE('id_ID').format(time);
    date = DateFormat.yMMMMd('id_ID').format(time);
  }
  factory ModelCuaca.empty() {
    return ModelCuaca(
      time: DateTime.now(),
      description: '',
      temperature: 0.0,
      humidity: 0,
      weatherIcon: '',
      rainfall: 0.0,
    );
  }
  factory ModelCuaca.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final rainfall = json['rain'] != null ? json['rain']['3h'] : 0;

    return ModelCuaca(
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      description: weather['description'],
      temperature: (main['temp'] - 273.15).toDouble(),
      humidity: main['humidity'],
      weatherIcon: weather['icon'],
      rainfall: rainfall.toDouble(),
    );
  }

  String getWeatherDescription() {
    switch (weatherIcon) {
      case '01d':
      case '01n':
        return 'Cerah';
      case '02d':
      case '02n':
        return 'Cerah ';
      case '03d':
      case '03n':
        return 'Berawan';
      case '04d':
      case '04n':
        return 'Berawan ';
      case '09d':
      case '09n':
        return 'Gerimis';
      case '10d':
      case '10n':
        return 'Hujan';
      case '11d':
      case '11n':
        return 'Hujan ';
      default:
        return 'Tidak Tersedia';
    }
  }
}
