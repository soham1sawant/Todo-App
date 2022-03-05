import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/home_page/home_page.dart';
import 'package:todo_app/simple_bloc_observer.dart';

import 'features/todo/data/repository/todo_repository.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TodoRepository>(
          create: (context) => TodoRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodoBloc(
                todoRepository: RepositoryProvider.of<TodoRepository>(context))
              ..add(TodoLoadEvent()),
          ),
        ],
        child: const MaterialApp(
          title: "Todo's",
          home: HomePage(),
        ),
      ),
    );
  }
}
