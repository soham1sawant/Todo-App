import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.042),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.094),
            Text(
              "March 9, 2020",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.0398,
              ),
            ),
            SizedBox(height: size.height * 0.009962),
            Text(
              "5 incomplete ,5 completed",
              style: TextStyle(
                fontSize: size.height * 0.0174,
              ),
            ),
            SizedBox(height: size.height * 0.01992),
            Divider(height: size.height * 0.002490),
            SizedBox(height: size.height * 0.01992),
            Text(
              "Incomplete",
              style: TextStyle(
                fontSize: size.height * 0.0224,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01992),
            Container(
              height: size.height * 0.359,
              color: Colors.black,
            ),
            SizedBox(height: size.height * 0.0398),
            Text(
              "Completed",
              style: TextStyle(
                fontSize: size.height * 0.0224,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01992),
            Container(
              height: size.height * 0.229,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
