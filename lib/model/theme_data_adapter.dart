import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeDataAdapter extends TypeAdapter<ThemeData> {
  @override
  final int typeId = 0;

  @override
  ThemeData read(BinaryReader reader) {
    final brightness = reader.readBool();
    final hintColor = Color(reader.readInt());
    final backgroundColor = Color(reader.readInt());
    final tileColor = Color(reader.readInt());
    final textColor = Color(reader.readInt());
    final scaffoldBackgroundColor = Color(reader.readInt());
    final appBarTheme = Color(reader.readInt());
    final appBarThemeTitle = Color(reader.readInt());
    final appBarThemeIcon = Color(reader.readInt());
    final iconTheme = Color(reader.readInt());

    return ThemeData(
      brightness: brightness ? Brightness.dark : Brightness.light,
      hintColor: hintColor,
      backgroundColor: backgroundColor,
      listTileTheme: ListTileThemeData(tileColor: tileColor, textColor: textColor),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appBarTheme, titleTextStyle: TextStyle(color: appBarThemeTitle), iconTheme: (IconThemeData(color: appBarThemeIcon))),
      iconTheme: IconThemeData(color: iconTheme),
    );
  }

  @override
  void write(BinaryWriter writer, ThemeData obj) {
    writer.writeBool(obj.brightness == Brightness.dark);
    writer.writeInt(obj.hintColor.value);
    writer.writeInt(obj.backgroundColor.value);
    writer.writeInt(obj.listTileTheme.tileColor!.value);
    writer.writeInt(obj.listTileTheme.textColor!.value);
    writer.writeInt(obj.scaffoldBackgroundColor.value);
    writer.writeInt(obj.appBarTheme.backgroundColor!.value);
    writer.writeInt(obj.appBarTheme.titleTextStyle!.color!.value);
    writer.writeInt(obj.appBarTheme.iconTheme!.color!.value);
    writer.writeInt(obj.iconTheme.color!.value);
  }
}
