import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff3FB9B1),
                  border: Border.all(),
                ),
                child: BackButton(color: Colors.white)),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Detail',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCardDetail(),
            CustomCardDetail(),
            CustomCardDetail(),
          ],
        ),
      ),
    );
  }
}
