import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribble_air_app/screens/details_page.dart';
import 'package:dribble_air_app/widgets/custom_city_weather_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dribble_air_app/services/current_weather_client.dart';
import 'package:dribble_air_app/services/weather_api_client.dart';
import 'package:dribble_air_app/model/air_quality_model.dart';
import 'package:dribble_air_app/model/weather.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List weatherList = [];
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final cityController = TextEditingController();
  AirQualityApiClient client = AirQualityApiClient();
  AirQuality? data;
  CurrentWeatherApiClient client1 = CurrentWeatherApiClient();
  Weather? data1;

  Future<void> getData() async {
    data = await client.getCurrentAirQuality!;
    data1 = await client1.getCurrentWeather('Orlando');
  }

  // Future getUserName(String firstName) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .get({'first name': firstName});
  // }

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
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      'Hello Mikel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 30,
                        width: 72,
                        child: ElevatedButton(
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
                                          decoration: InputDecoration(
                                            hintText: "Search city",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.search),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: MaterialButton(
                                          onPressed: () {
                                            CustomCityWeatherCard(
                                                data1: data1, data: data);
                                          },
                                          child: Text('Add City'),
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFECAA9),
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          child: Text(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomCityWeatherCard(data1: data1, data: data),
                    CustomCityWeatherCard(data1: data1, data: data),
                  ],
                ),
                Spacer(),
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
                          onPressed: () {},
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
              ]),
            );
          }
          return Container();
        },
      ),
    );
  }
}
