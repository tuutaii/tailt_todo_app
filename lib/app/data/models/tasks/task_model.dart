import 'package:flutter/cupertino.dart';

import '../../../core/styles/style.dart';

class TaskModel {
  String id, title, decription, date, time, createAt;
  int tagNumber, category;

  TaskModel(
    this.id,
    this.title,
    this.decription,
    this.date,
    this.time,
    this.tagNumber,
    this.category,
    this.createAt,
  );
}

class CategoryModel {
  String name;
  IconData icon;
  Color color;
  CategoryModel(
    this.name,
    this.icon,
    this.color,
  );
}

List<CategoryModel> listCategory = [
  CategoryModel('Work', CupertinoIcons.book, AppTheme.work),
  CategoryModel('Social', CupertinoIcons.speaker_3, AppTheme.social),
  CategoryModel('Movie', CupertinoIcons.film, AppTheme.movie),
  CategoryModel('Home', CupertinoIcons.home, AppTheme.home),
  CategoryModel('Sport', CupertinoIcons.sportscourt, AppTheme.sport),
  CategoryModel('Music', CupertinoIcons.music_note_list, AppTheme.muisc),
  CategoryModel('Money', CupertinoIcons.money_pound_circle, AppTheme.money),
  CategoryModel('Relax', CupertinoIcons.bed_double, AppTheme.relax),
];
