import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/date/bloc/date_bloc.dart';
import 'package:todo_app/features/date/data/repository/date_repository.dart';
import 'package:todo_app/features/theme/data/repository/theme_repository.dart';
import 'package:todo_app/features/todo/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/add_task_page/add_task_page.dart';
import 'package:todo_app/presentation/home_page/home_page.dart';
import 'package:todo_app/presentation/theme/custom_theme.dart';
import 'package:todo_app/presentation/theme_page/theme_page.dart';
import 'package:todo_app/simple_bloc_observer.dart';

import 'features/theme/bloc/theme_bloc.dart';
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
        RepositoryProvider<DateRepository>(
          create: (context) => DateRepository(),
        ),
        RepositoryProvider<ThemeRepository>(
          create: (context) => ThemeRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodoBloc(
              todoRepository: RepositoryProvider.of<TodoRepository>(context),
            )..add(const TodoLoadEvent()),
          ),
          BlocProvider(
            create: (context) => DateBloc(
              dateRepository: RepositoryProvider.of<DateRepository>(context),
            )..add(const DateLoadEvent()),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(
              themeRepository: RepositoryProvider.of<ThemeRepository>(context),
            )..add(const ThemeLoadEvent()),
          ),
        ],
        child: MaterialApp(
          title: "Todo's",
          routes: {
            "/themepage": ((context) => const ThemePage()),
            "/homepage": ((context) => const HomePage()),
            "/addtask": ((context) => const AddTaskPage()),
          },
          themeMode: ThemeMode.dark,
          theme: CustomTheme.darkTheme,
          home: const HomePage(),
        ),
      ),
    );
  }
}
