import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'theme_state.g.dart';

@immutable
@HiveType(typeId: 4)
class ThemeState extends Equatable {

  @HiveField(0)
  ThemeData themeData;

  @override
  List<Object> get props => [themeData];

  ThemeState({required this.themeData,}) : super();

}

