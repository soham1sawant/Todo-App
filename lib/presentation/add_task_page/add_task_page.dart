import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late TextEditingController _headingController;
  late TextEditingController _infoController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _headingController = TextEditingController();
    _infoController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _headingController.dispose();
    _infoController.dispose();
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
            SizedBox(height: size.height * 0.07),
            Text(
              "Add Task",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.05,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _headingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Heading can't be empty!";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "enter heading",
                  ),
                ),
                SizedBox(height: size.height * 0.055),
                TextFormField(
                  controller: _infoController,
                  maxLines: 10,
                  
                  decoration: const InputDecoration(
                    hintText: "enter description",
                  ),
                ),
              ]),
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
            Icons.done,
            size: size.width * 0.09,
            color: Colors.white,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              BlocProvider.of<TodoBloc>(context).add(TodoAddedEvent(
                  addedTodo: TodoModel(
                _headingController.text,
                _infoController.text,
              )));

              _headingController.clear();
              _infoController.clear();

              Navigator.pushReplacementNamed(context, "/homepage");
            }
          },
        ),
      ),
    );
  }
}
