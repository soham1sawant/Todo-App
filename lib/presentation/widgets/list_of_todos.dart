import 'package:flutter/material.dart';

class ListOfTodos extends StatelessWidget {
  const ListOfTodos({
    Key? key,
    required this.scrollController,
    required this.heightOfList,
    required this.isCompleted,
  }) : super(key: key);

  final ScrollController scrollController;
  final double heightOfList;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * heightOfList,
      child: ListView.builder(
        controller: scrollController,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.01992),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.07,
                  height: size.height * 0.035,
                  child: Checkbox(
                    value: isCompleted,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(width: size.width * 0.0246),
                Text(
                  "Print parking Passes",
                  style: TextStyle(fontSize: size.height * 0.029),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
