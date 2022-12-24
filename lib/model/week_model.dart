import 'package:hive_flutter/hive_flutter.dart';
part 'week_model.g.dart';

@HiveType(typeId: 1)
class WeekModel {
  WeekModel({
    required this.morning,
    required this.afterNoon,
    required this.evening,
    required this.id,
    required this.week,
    required this.isVisible,
    required this.sort,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  bool morning;
  @HiveField(2)
  bool afterNoon;
  @HiveField(3)
  bool evening;
  @HiveField(4)
  String week;
  @HiveField(5)
  bool isVisible;
  @HiveField(6)
  int sort;
}
