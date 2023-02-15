import 'package:dribble_air_app/model/weather.dart';
import 'package:dribble_air_app/services/current_weather_client.dart';
import 'package:dribble_air_app/services/weather_api_client.dart';
import 'package:flutter/material.dart';

import '../model/air_quality_model.dart';

class CustomCardDetail extends StatelessWidget {
  CustomCardDetail({
    Key? key,
  }) : super(key: key);
  AirQualityApiClient client = AirQualityApiClient();
  AirQuality? data;
  CurrentWeatherApiClient client1 = CurrentWeatherApiClient();
  Weather? data1;

  Future<void> getData() async {
    data = await client.getCurrentAirQuality!;
    data1 = await client1.getCurrentWeather('Orlando');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 300,
            width: 250,
            child: Container(
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
                            'Jarkarta',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Todays air qualty is good',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Text(
                        '30 AQI US',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
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
                              '24C',
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
                              '57%',
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
                              'Light',
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
                              '13 Km/h',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 125,
                    width: 250,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green.shade100),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Important information',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.shield,
                                color: Colors.green,
                              ),
                              Text(
                                'Dont forget to always wear a mask \n when doing activites outside.',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
