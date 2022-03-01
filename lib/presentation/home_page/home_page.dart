import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _incompleteController;
  late ScrollController _completedController;

  @override
  void initState() {
    super.initState();
    _incompleteController = ScrollController();
    _completedController = ScrollController();
  }

  @override
  void dispose() {
    _incompleteController.dispose();
    _completedController.dispose();
    super.dispose();
  }

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
              child: ListView.builder(
                controller: _incompleteController,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.01992),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.064,
                          height: size.height * 0.0298,
                          child: Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(width: size.width * 0.0246),
                        Text("Print parking Passes"),
                      ],
                    ),
                  );
                },
              ),
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
              child: ListView.builder(
                controller: _completedController,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.01992),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.064,
                          height: size.height * 0.0298,
                          child: Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(width: size.width * 0.0246),
                        const Text("Print parking Passes"),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: size.height * 0.0697,
        width: size.width * 0.1493,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff515CC6),
          child: Icon(
            Icons.add,
            size: size.width * 0.0533,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
