import 'package:flutter/material.dart';

import '../widgets/list_of_todos.dart';

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
                fontSize: size.height * 0.05,
              ),
            ),
            SizedBox(height: size.height * 0.009962),
            Text(
              "5 incomplete ,5 completed",
              style: TextStyle(
                fontSize: size.height * 0.02,
              ),
            ),
            SizedBox(height: size.height * 0.01992),
            Divider(height: size.height * 0.002490),
            SizedBox(height: size.height * 0.01992),
            Text(
              "Incomplete",
              style: TextStyle(
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.019),
            ListOfTodos(
              scrollController: _incompleteController,
              heightOfList: 0.359,
              isCompleted: false,
            ),
            SizedBox(height: size.height * 0.0398),
            Text(
              "Completed",
              style: TextStyle(
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.019),
            ListOfTodos(
              scrollController: _completedController,
              heightOfList: 0.229,
              isCompleted: true,
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: size.height * 0.0697,
        width: size.height * 0.0697,
        child: FloatingActionButton(
          backgroundColor: const Color(0xff515CC6),
          child: Icon(
            Icons.add,
            size: size.width * 0.095,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

