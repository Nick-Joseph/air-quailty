// calling http request

import 'dart:convert';

import 'package:dribble_air_app/model/weather.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=6aa21d14a805c0431835f04550487f37&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    // AirQuality airQuality = AirQuality.fromJson(body)
    //or we can do this
    return Weather.fromJson(body);
  }
}
