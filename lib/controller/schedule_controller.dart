import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../const/const.dart';
import '../model/week_model.dart';
import '../services/db_functions.dart';
import '../view/scheduling/scheduling_screen.dart';

class ScheduleController extends GetxController {
  RxList<WeekModel> allData = <WeekModel>[].obs;
  RxList<WeekModel> prevData = <WeekModel>[].obs;
  RxBool isLoading = false.obs;
  final DbFunctions dbFunctions = DbFunctions();
  Future<void> getData() async {
    dbFunctions.ceateDatatoDb();
    allData.value = await dbFunctions.getDataFromDB();
  }

  Future<void> getDataPrev() async {
    prevData.value = await dbFunctions.getDataFromDBPrev();
  }

  Future<String> updateDataToDb() async {
    isLoading.value = true;
    final String result = await dbFunctions.updateDataDb(allData);
    isLoading.value = false;
    getDataPrev();
    return result;
  }

  void tickButtonFunction(int index) {
    if (allData[index].isVisible) {
      allData[index].isVisible = false;
    } else {
      allData[index].isVisible = true;
    }
    if (allData[index].isVisible) {
      allData[index].morning = true;
      allData[index].afterNoon = true;
      allData[index].evening = true;
    } else {
      allData[index].morning = false;
      allData[index].afterNoon = false;
      allData[index].evening = false;
    }
    allData.refresh();
  }

  void buttonFunction(String title, int index) {
    if (title == 'Morning') {
      if (allData[index].morning) {
        allData[index].morning = false;
      } else {
        allData[index].morning = true;
      }
      allData.refresh();
    }
    if (title == 'Afternoon') {
      if (allData[index].afterNoon) {
        allData[index].afterNoon = false;
      } else {
        allData[index].afterNoon = true;
      }
      allData.refresh();
    }
    if (title == 'Evening') {
      if (allData[index].evening) {
        allData[index].evening = false;
      } else {
        allData[index].evening = true;
      }
      allData.refresh();
    }
  }

  void saveButton(String title, BuildContext context,
      [bool mounted = true]) async {
    if (title == 'Schedule') {
      Navigator.of(context)
          .push(MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return SchedulingScreen();
      }));
    } else {
      final String result = await updateDataToDb();
      if (result == 'success') {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully updated'),
          duration: Duration(seconds: 1),
        ));

        Navigator.of(context).pop();
      } else {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unsuccessfull'),
          duration: Duration(seconds: 1),
        ));
      }
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    Hive.box<WeekModel>(boxName);
    super.onClose();
  }

  Future<bool> onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Really"),
          content: const Text("Do you want to close the app?"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No")),
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
    return exitApp;
  }
}
