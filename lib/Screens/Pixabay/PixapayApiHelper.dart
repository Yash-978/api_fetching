import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  // static ApiHelper apiHelper = ApiHelper._instance();
  //
  // ApiHelper._instance();

  Future<Map> fetchApiData(String search) async {
    String api =
        "https://pixabay.com/api/?key=45128540-b41d61c399916b725dc169617&q=$search";
    // "https://pixabay.com/api/?key=45126144-1df22736d7cf064ea7b654803&q=yellow+flowers&image_type=photo&pretty=true";
    // "https://pixabay.com/api/?key=45126144-1df22736d7cf064ea7b654803&q=$search";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
