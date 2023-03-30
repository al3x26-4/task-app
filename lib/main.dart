import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/constants/theme/bloc/bloc.dart';
import 'package:todo/model/theme_data_adapter.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/splash_screen.dart';
import 'constants/theme/app_themes.dart';
import 'model/todo.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  Hive.registerAdapter(ThemeDataAdapter());
  Hive.registerAdapter(ThemeStateAdapter());
  Hive.registerAdapter(ToDoAdapter());

  // open Hive boxes
  var box = await Hive.openBox<List>('todolistbox');
  var themestatebox = await Hive.openBox('themestatesbox');

  // if first time opening app set theme to BlueWhite
  if (themestatebox.get('THEMESTATEDATA') == null) {
    themestatebox.put('THEMESTATEDATA', ThemeState(themeData: appThemeData[AppTheme.BlueWhite]!));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      )
    );
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
        theme: state.themeData,
        debugShowCheckedModeBanner: false,
        title: 'Tasks',
        home: SplashScreen()
    );
  }
}

