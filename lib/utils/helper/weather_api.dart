import "dart:convert";

import "package:http/http.dart" as http;

import "../../models/wether_model.dart";

class WeatherApi {
  WeatherApi._();

  static final WeatherApi weatherApi = WeatherApi._();

  Future<Weather?> featchweather({required String location}) async {
    http.Response response = await http.get((Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=3cd73ba36dd847d98a4100033242607&q=$location&aqi=no")));

    if (response.statusCode == 200) {
      String body = response.body;

      Map decodeData = jsonDecode(body);
      return Weather.fromJson(json: decodeData);
    }
    return null;
  }
}
