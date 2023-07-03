import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
class WeatherService {
  Future<Weather> getWeatherData(String place) async {
    try {
      // b38d482ee58f4b4f8d633932230207
      // final uri=Uri.http("api.weatherapi.com","/v1");
      final queryParameters = {
        "key": "b38d482ee58f4b4f8d633932230207",
        "q": place,
      };
      final uri = Uri.http(
          "api.weatherapi.com", "/v1/current.json", queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception("can not get weather");
      }
    }
    catch (e) {
      rethrow;
    }
  }



  // Future<Weather> getWeatherData(String place) async {
  //   var today=new DateTime.now();
  //   try {
  //     // b38d482ee58f4b4f8d633932230207
  //     // final uri=Uri.http("api.weatherapi.com","/v1");
  //     final queryParameters = {
  //       "key": "b38d482ee58f4b4f8d633932230207",
  //       "q": place,
  //     };
  //     final uri = Uri.http(
  //         "api.weatherapi.com", "/v1/current.json", queryParameters);
  //     final response = await http.get(uri+new DateFormat("y/m/d").format(today.add(new Duration(days:2))).toString());
  //     if (response.statusCode == 200) {
  //       return Weather.fromJson(jsonDecode(response.body));
  //     }
  //     else {
  //       throw Exception("can not get weather");
  //     }
  //   }
  //   catch (e) {
  //     rethrow;
  //   }
  // }

}
