import 'package:dribble_air_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Hello Mikel',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    width: 72,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => DetailsPage()),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFECAA9),
                        side: const BorderSide(color: Colors.black, width: 2),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                          )
                        ],
                      ),
                    )),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 55,
              width: 285,
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
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          child: const Text(
                            'Home',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.navigation_outlined,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.graphic_eq_outlined,
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
      ),
    );
  }
}
