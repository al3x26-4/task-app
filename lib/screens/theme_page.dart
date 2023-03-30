import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/theme/app_themes.dart';
import 'package:todo/constants/theme/bloc/bloc.dart';

import '../data/database.dart';
import '../model/theme_circle.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  ToDoDatabase db = ToDoDatabase();
  Map<AppTheme, ThemeData> themes = {};
  ThemeState themestatedata = ThemeState(themeData: appThemeData[AppTheme.BlueWhite]!);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
      //  padding: const EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Container(
            color: Colors.transparent,
           // padding: const EdgeInsets.all(10),
            child: MaterialButton(
              child: CustomPaint(
                painter: HalfLeftHalfRightCirclePainter(
                  leftColor: appThemeData[itemAppTheme]!.backgroundColor,
                  rightColor: appThemeData[itemAppTheme]!.listTileTheme.tileColor!,
                ),
                size: const Size(60, 60),
              ),
              onPressed: () {
                changeTheme(context, itemAppTheme);
                },
            ),
          );
        },
      ),
    );
  }

  void changeTheme(context, itemAppTheme) {
    BlocProvider.of<ThemeBloc>(context).add(
      ThemeChanged(theme: itemAppTheme),
    );

  }
}
