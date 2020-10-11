import 'package:http/http.dart';
import 'dart:convert';
import 'location.dart';

class NetworkingBrain {
  NetworkingBrain(this.url);

  final String url;
  double latitude;
  double longitude;

  Future getData() async {
    print('in getdata');
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return data;
    }
  }
}
