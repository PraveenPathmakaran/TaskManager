import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/colors.dart';
import '../../../controller/schedule_controller.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        scheduleController.buttonFunction(title, index);
      },
      style: OutlinedButton.styleFrom(
          foregroundColor: bColor(title),
          side: BorderSide(
            color: bColor(title),
          ),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: Text(title),
    );
  }

  Color bColor(String title) {
    //conditional rendering for color
    if (title == 'Morning') {
      return scheduleController.allData[index].morning ? blueColor : greyColor;
    } else if (title == 'Afternoon') {
      return scheduleController.allData[index].afterNoon
          ? blueColor
          : greyColor;
    } else {
      return scheduleController.allData[index].evening ? blueColor : greyColor;
    }
  }
}
