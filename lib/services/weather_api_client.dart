// calling http request

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dribble_air_app/model/air_quality_model.dart';

class AirQualityApiClient {
  Future<AirQuality>? get getCurrentAirQuality async {
    var endpoint = Uri.parse(
        "http://api.openweathermap.org/data/2.5/air_pollution?lat=28.538336&lon=-81.379234&appid=6aa21d14a805c0431835f04550487f37");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    // AirQuality airQuality = AirQuality.fromJson(body)
    //or we can do this
    return AirQuality.fromJson(body);
  }
}
