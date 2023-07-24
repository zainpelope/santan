class WeatherModel {
  final int id;
  final String uuid;
  final int weather;
  final String weatherStatus;
  final String date;

  WeatherModel({
    required this.id,
    required this.uuid,
    required this.weather,
    required this.weatherStatus,
    required this.date,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      uuid: json['uuid'],
      weather: json['weather'],
      weatherStatus: json['weather_status'],
      date: json['date'],
    );
  }
}
