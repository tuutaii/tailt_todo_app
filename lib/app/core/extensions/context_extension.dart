import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primary => colorScheme.primary;
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get secondary => colorScheme.secondary;
  Color get secondaryContainer => colorScheme.secondaryContainer;
  Color get surface => colorScheme.surface;
  Color get background => colorScheme.background;
  Color get error => colorScheme.error;
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSurface => colorScheme.onSurface;
  Color get onBackground => colorScheme.onBackground;
  Color get onError => colorScheme.onError;

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get overline => Theme.of(this).textTheme.overline!;
  TextStyle get caption => Theme.of(this).textTheme.caption!;
  TextStyle get button => Theme.of(this).textTheme.button!;
  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2!;
  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1!;
  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2!;
  TextStyle get subtitle1 => Theme.of(this).textTheme.subtitle1!;
  TextStyle get headline1 => Theme.of(this).textTheme.headline1!;
  TextStyle get headline2 => Theme.of(this).textTheme.headline2!;
  TextStyle get headline3 => Theme.of(this).textTheme.headline3!;
  TextStyle get headline4 => Theme.of(this).textTheme.headline4!;
  TextStyle get headline5 => Theme.of(this).textTheme.headline5!;
  TextStyle get headline6 => Theme.of(this).textTheme.headline6!;

  Size get size => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
  double get scale => MediaQuery.of(this).devicePixelRatio;

  Orientation get orientation => MediaQuery.of(this).orientation;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get canvasColor => Theme.of(this).canvasColor;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get widthScale => width > height ? height : width;

  double get heightScale => width < height ? height : width;

  int get widthPixels => (width * height).toInt();
  int get heightPixels => (height * scale).toInt();
}

extension FileExt on String {
  Uint8List get toBytes => File(this).readAsBytesSync();
  File get toFile => File(this);
}
