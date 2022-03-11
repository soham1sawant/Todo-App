import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';

class ListOfTodos extends StatelessWidget {
  const ListOfTodos({
    Key? key,
    required this.scrollController,
    required this.heightOfList,
    required this.isCompleted,
    required this.listofTodos,
  }) : super(key: key);

  final ScrollController scrollController;
  final double heightOfList;
  final bool isCompleted;
  final List<TodoModel> listofTodos;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * heightOfList,
      child: ListView.builder(
        controller: scrollController,
        itemCount: listofTodos.length,
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
                    onChanged: (value) {
                      if (isCompleted) {
                        BlocProvider.of<TodoBloc>(context).add(
                          TodoIncompletedEvent(
                            incompletedTodo: TodoModel(
                              listofTodos[index].heading,
                              listofTodos[index].description,
                            ),
                          ),
                        );
                      } else {
                        BlocProvider.of<TodoBloc>(context).add(
                          TodoCompletedEvent(
                            completedTodo: TodoModel(
                              listofTodos[index].heading,
                              listofTodos[index].description,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(width: size.width * 0.0246),
                Text(
                  listofTodos[index].heading,
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
