import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:santan/model/model_tanaman.dart';

class ApiService {
  static Future<List<Tanaman>> getAllPlant() async {
    final response = await http.get(
      Uri.parse(
          //testing mac kak fandy
         // 'https://d154c971-4491-4d77-97af-40590f47dde0.mock.pstmn.io/api/v1/tanaman'),

          //testing mac saya
          'https://7a0de9e0-743f-429a-8c8f-9bc7cd6f73a6.mock.pstmn.io/api/tanaman'),
    );
    List<Tanaman> tanamanList = [];

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['result'] != null && data['result']['tanaman'] != null) {
        final tanamanData = data['result']['tanaman'];

        for (var item in tanamanData) {
          Tanaman tanaman = Tanaman.fromJson(item);
          tanamanList.add(tanaman);
        }
      } else {
        print('Invalid data format');
      }
    } else {
      print('Error: ${response.statusCode}');
    }

    return tanamanList;
  }
}
