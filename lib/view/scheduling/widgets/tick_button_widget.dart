import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/colors.dart';
import '../../../controller/schedule_controller.dart';

class TickButtonWidget extends StatelessWidget {
  TickButtonWidget({super.key, required this.index});
  final ScheduleController scheduleController = Get.put(ScheduleController());
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        scheduleController.tickButtonFunction(index);
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: scheduleController.allData[index].isVisible
              ? greenColor
              : greyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.check,
          size: 15,
          color: whiteColor,
        ),
      ),
    );
  }
}
