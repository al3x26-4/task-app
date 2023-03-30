import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/constants/theme/app_themes.dart';
import './bloc.dart';

final _mythemestateBox = Hive.box('themestatesbox');

ThemeState themestatedata = _mythemestateBox.get('THEMESTATEDATA');


class ThemeInitial extends ThemeState {
  ThemeInitial({required super.themeData});

  @override
  List<Object> get props => [themeData];
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(
      ThemeInitial(themeData: themestatedata.themeData)
  );

  @override
  ThemeState get initialState => themestatedata;


  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      _mythemestateBox.put('THEMESTATEDATA', ThemeState(themeData: appThemeData[event.theme]!));
      yield ThemeState(themeData: appThemeData[event.theme]!);
    }
  }
}