import 'package:hive_flutter/hive_flutter.dart';
import '../const/const.dart';
import '../model/week_model.dart';

class DbFunctions {
  Future<void> ceateDatatoDb() async {
    final Box<WeekModel> box = Hive.box<WeekModel>(boxName);

    if (box.isEmpty) {
      box.putAll(
        <String, WeekModel>{
          'Sunday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Sunday',
              isVisible: true,
              week: 'SUN',
              sort: 1),
          'Monday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Monday',
              isVisible: true,
              week: 'MON',
              sort: 2),
          'Tuesday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Tuesday',
              isVisible: true,
              week: 'TUE',
              sort: 3),
          'Wednesday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Wednesday',
              isVisible: true,
              week: 'WED',
              sort: 4),
          'Thursday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Thursday',
              isVisible: true,
              week: 'THU',
              sort: 5),
          'Friday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Friday',
              isVisible: true,
              week: 'FRI',
              sort: 6),
          'Saturday': WeekModel(
              afterNoon: true,
              evening: true,
              morning: true,
              id: 'Saturday',
              isVisible: true,
              week: 'SAT',
              sort: 7),
        },
      );
    }
  }

  Future<List<WeekModel>> getDataFromDB() async {
    final Box<WeekModel> box = Hive.box<WeekModel>(boxName);
    final List<WeekModel> weekData = box.values.toList();
    //for sorting week sun to sat
    weekData.sort((WeekModel a, WeekModel b) => a.sort.compareTo(b.sort));

    return weekData;
  }

  Future<String> updateDataDb(List<WeekModel> weekList) async {
    final Box<WeekModel> box = Hive.box<WeekModel>(boxName);
    if (weekList.isEmpty) {
      return 'error';
    }
    for (final WeekModel data in weekList) {
      box.put(data.id, data);
    }

    return 'success';
  }
}
