import 'package:dribble_air_app/model/air_quality_model.dart';
import 'package:dribble_air_app/model/weather.dart';
import 'package:flutter/material.dart';

import '../screens/details_page.dart';

class CustomCityWeatherCard extends StatelessWidget {
  const CustomCityWeatherCard({
    super.key,
    required this.data1,
    required this.data,
  });

  final Weather? data1;
  final AirQuality? data;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 1.0,
        child: Container(
          height: 70,
          width: 325,
          decoration: BoxDecoration(border: Border.all()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 200,
          width: 300,
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => DetailsPage()),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.rectangle,
                                border: Border.all(),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${data1!.locationName}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Todays air quality is good',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '${data!.aqi} AQI US',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: const [],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.thermostat_auto_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                '${data1!.temp!.roundToDouble()}°C',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.water,
                                color: Colors.black,
                              ),
                              Text(
                                '${data1!.humidity}%',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.sunny,
                                color: Colors.black,
                              ),
                              Text(
                                '${data1!.weatherDescription}',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.wind_power_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                '${data1!.windSpeed} K/m',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
