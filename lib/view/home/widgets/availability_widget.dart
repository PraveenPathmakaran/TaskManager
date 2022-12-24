import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../controller/schedule_controller.dart';
import '../../../model/week_model.dart';
import '../../scheduling/widgets/text_widget.dart';

Widget availability(String title) {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  if (scheduleController.allData.isEmpty) {
    scheduleController.getData();
    return const SizedBox();
  }

  final WeekModel value = scheduleController.allData
      .firstWhere((WeekModel element) => element.id == title);

  if (value.morning && value.afterNoon && value.evening) {
    return TextWidget(
      title: '$title whole day,',
      size: fontSizeText,
    );
  } else if (value.morning && value.afterNoon) {
    return TextWidget(
      title: '$title Morning and Afternoon,',
      size: fontSizeText,
    );
  } else if (value.afterNoon && value.evening) {
    return TextWidget(
        title: '$title Afternoon and Evening,', size: fontSizeText);
  } else if (value.morning && value.evening) {
    return TextWidget(title: '$title Morning and Evening,', size: fontSizeText);
  } else if (value.morning) {
    return TextWidget(title: '$title Morning,', size: fontSizeText);
  } else if (value.afterNoon) {
    return TextWidget(title: '$title Afternoon,', size: fontSizeText);
  } else if (value.evening) {
    return TextWidget(title: '$title Evening,', size: fontSizeText);
  } else {
    return const SizedBox();
  }
}
