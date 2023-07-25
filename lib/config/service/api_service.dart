import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:santan/models/login_model/login_model.dart';
import 'package:santan/models/tanaman/plant.dart';
import 'package:santan/models/weather/model.dart';
import 'package:santan/utils/helper/pref_helper.dart';

class ApiService {
  static const baseUrl = 'https://service.thengoding.com';
  static var headers = <String, String>{
    'Content-Type': 'application/json',
  };

  static Future<LoginModel?> login(
      {required String username, required String password}) async {
    const url = '$baseUrl/users/login';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
      headers: headers,
    );
    log('response ${response.body}');
    LoginModel? loginModel;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      loginModel = LoginModel.fromJson(data);
    }
    return loginModel;
  }

  static Future<List<Plant>> getAllPlant() async {
    const url = '$baseUrl/plants';
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    log('response ${response.body}');
    List<Plant> plantList = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var item in data) {
        Plant plant = Plant.fromJson(item);
        plantList.add(plant);
      }
    } else {
      print('Invalid data format');
    }

    return plantList;
  }

  Future<List<WeatherModel>> fetchWeatherData() async {
    const url = '$baseUrl/weathers';
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => WeatherModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load data from API");
    }
  }

  static Future<bool> removePlant({required num id}) async {
    const url = '$baseUrl/plants';
    final token = await PrefHelper.getToken();
    headers.addAll({
      'Authorization': token ?? '',
    });
    final response = await http.delete(
      Uri.parse('$url/$id'),
      headers: headers,
    );
    log('response ${response.body}');
    bool isSuccess = false;
    if (response.statusCode == 200) {
      isSuccess = true;
    } else {
      print('Invalid data format');
    }
    return isSuccess;
  }

  static Future<bool> addPlant({
    required String name,
    required String description,
    required File image, // Change the image type to File
    required String season,
  }) async {
    const url = '$baseUrl/plants';
    final token = await PrefHelper.getToken();
    final headers = {
      'Authorization': token ?? '',
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);

    // Add text fields to the request
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['season'] = season;

    // Add the image file to the request
    var imageStream = http.ByteStream(image.openRead());
    var length = await image.length();
    var multipartFile = http.MultipartFile('image', imageStream, length,
        filename: image.path.split('/').last);
    request.files.add(multipartFile);

    try {
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      print('response: $responseData');

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Invalid data format');
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  static Future<bool> updatePlant({
    required num id,
    String? name,
    String? description,
    File? image, // Change the image type to File
    String? season,
  }) async {
    final url = '$baseUrl/plants/$id';
    final token = await PrefHelper.getToken();
    final headers = {
      'Authorization': token ?? '',
    };

    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.headers.addAll(headers);

    // Add text fields to the request
    if (name != null) request.fields['name'] = name;
    if (description != null) request.fields['description'] = description;
    if (season != null) request.fields['season'] = season;

    // Add the image file to the request
    if (image?.path != '') {
      var imageStream = http.ByteStream(image!.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile('image', imageStream, length,
          filename: image.path.split('/').last);
      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      print('response: $responseData');

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Invalid data format');
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  static Future<List<WeatherModel>> getWeathers() async {
    const url = '$baseUrl/weathers';
    final token = await PrefHelper.getToken();
    final headers = {
      'Authorization': token ?? '',
    };
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    log('response ${response.body}');
    List<WeatherModel> weatherList = [];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var item in data) {
        WeatherModel weather = WeatherModel.fromJson(item);
        weatherList.add(weather);
      }
    } else {
      log('Invalid data format');
    }
    return weatherList;
  }
}
