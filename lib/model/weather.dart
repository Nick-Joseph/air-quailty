class Weather {
  double? temp;
  double? windSpeed;
  int? humidity;
  String? weatherDescription;
  String? locationName;

  Weather(
      {this.temp,
      this.windSpeed,
      this.humidity,
      this.weatherDescription,
      this.locationName});

  Weather.fromJson(Map<dynamic, dynamic> json) {
    temp = json['main']['temp'];
    windSpeed = json['wind']['speed'];
    humidity = json['main']['humidity'];
    weatherDescription = json['weather'][0]['description'];
    locationName = json['name'];
  }
}
