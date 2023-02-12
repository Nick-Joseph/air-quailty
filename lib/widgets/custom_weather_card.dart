import 'package:flutter/material.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                          children: const [
                            Text(
                              'Jakarta',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Todays air quality is good',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        const Text(
                          '30 AQI US',
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
                            children: const [
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
                            children: const [
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
                            children: const [
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
                            children: const [
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
