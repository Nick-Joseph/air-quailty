//building model to use for the api
class AirQuality {
  num? aqi;
  num? co;
  num? no;
  num? no2;
  num? o3;
  num? so2;

  AirQuality({
    this.aqi,
    this.co,
    this.no,
    this.no2,
    this.o3,
    this.so2,
  });
  //function to parse the JSON file into the model
  AirQuality.fromJson(Map<dynamic, dynamic> json) {
    aqi = json['list'][0]['main']['aqi'];
    co = json['list'][0]['components']['co'];
    no = json['list'][0]['components']['no'];
    no2 = json['list'][0]['components']['no2'];
    o3 = json['list'][0]['components']['o3'];
    so2 = json['list'][0]['components']['so2'];
  }
}
