import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              "March 9, 2020",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
            Text(
              "5 incomplete ,5 completed",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
