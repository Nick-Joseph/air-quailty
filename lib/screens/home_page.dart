import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notification_add_outlined,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.rectangle),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Hello Mikel',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    width: 72,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '+ Add',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFECAA9),
                        side: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
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
                                        shape: BoxShape.rectangle),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
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
                              Text(
                                '30 AQI US',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Row(
                            children: [],
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
                                      shape: BoxShape.rectangle),
                                ),
                              ),
                            ),
                            Column(
                              children: [
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
                            Text(
                              '30 AQI US',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Row(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 55,
              width: 285,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xff3FB9B1),
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
                          onPressed: () {},
                          child: Text(
                            'Home',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFECAA9),
                            side: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.navigation_outlined,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.graphic_eq_outlined,
                      color: Colors.white,
                    ),
                    Icon(
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
