import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aej_workshop_flutter_networking_part_1/core/model/travel_response.dart';

class ApiService {
  Future<TravelResponse> getTravelData() async {
    String url = 'http://erporate.com/bootcamp/jsonBootcamp.php';
    try {
      final response = await http.get(url);
      //hit api
      if (response.statusCode == 200) {
        ///berhasil
        print('response ${response.statusCode}');

        ///print response
        print('response: ${response.body}');

        ///mapping hasil response body json
        Map json = jsonDecode(response.body);

        ///hasil response mapping ke dalam model TravelResponse
        TravelResponse travelResponse = TravelResponse.fromJson(json);

        return travelResponse;
      } else {
        ///gagal
        print('response ${response.statusCode}');
        print('failed');
      }
    } catch (e) {
      ///print error
      print(e.toString());
    }
  }
}
