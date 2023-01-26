import 'package:dribble_air_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dribble_air_app/services/current_weather_client.dart';
import 'package:dribble_air_app/services/weather_api_client.dart';
import 'package:dribble_air_app/model/air_quality_model.dart';
import 'package:dribble_air_app/model/weather.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  AirQualityApiClient client = AirQualityApiClient();
  AirQuality? data;
  CurrentWeatherApiClient client1 = CurrentWeatherApiClient();
  Weather? data1;

  Future<void> getData() async {
    data = await client.getCurrentAirQuality!;
    data1 = await client1.getCurrentWeather!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notification_add_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.red, shape: BoxShape.rectangle),
            ),
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Hello Mikel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 30,
                            width: 72,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFECAA9),
                                side: const BorderSide(
                                    color: Colors.black, width: 2),
                              ),
                              child: const Text(
                                '+ Add',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '23 Novemeber 2022',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                    Stack(
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
                                              padding:
                                                  const EdgeInsets.all(16.0),
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
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Todays air quality is good',
                                                  style:
                                                      TextStyle(fontSize: 10),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .thermostat_auto_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    '${data1!.temp!.roundToDouble()}°C',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Stack(
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
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 55,
                      width: 325,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(0xff3FB9B1),
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 35,
                                width: 72,
                                child: ElevatedButton(
                                  onPressed: () {
                                    signUserOut();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFECAA9),
                                    side: const BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  child: const Text(
                                    'Home',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.navigation_outlined),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 1200,
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Add another city location',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: TextFormField(
                                              onChanged: (newValue) {},
                                              decoration: const InputDecoration(
                                                hintText: "Search city",
                                                border: OutlineInputBorder(),
                                                prefixIcon: Icon(Icons.search),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.graphic_eq_outlined),
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.radio_button_checked_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ));
  }
}
