import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/const.dart';
import '../../../controller/schedule_controller.dart';
import '../../../model/week_model.dart';
import '../../scheduling/widgets/text_widget.dart';

final ScheduleController scheduleController = Get.put(ScheduleController());
Widget availability(String title) {
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

Widget preAvailability(String title) {
  if (scheduleController.prevData.isEmpty) {
    return const SizedBox();
  }

  final WeekModel prevValues = scheduleController.prevData
      .firstWhere((WeekModel element) => element.id == title);

  log(prevValues.morning.toString());

  if (prevValues.morning && prevValues.afterNoon && prevValues.evening) {
    return TextWidget(
      title: '$title whole day,',
      size: fontSizeText,
    );
  } else if (prevValues.morning && prevValues.afterNoon) {
    return TextWidget(
      title: '$title Morning and Afternoon,',
      size: fontSizeText,
    );
  } else if (prevValues.afterNoon && prevValues.evening) {
    return TextWidget(
        title: '$title Afternoon and Evening,', size: fontSizeText);
  } else if (prevValues.morning && prevValues.evening) {
    return TextWidget(title: '$title Morning and Evening,', size: fontSizeText);
  } else if (prevValues.morning) {
    return TextWidget(title: '$title Morning,', size: fontSizeText);
  } else if (prevValues.afterNoon) {
    return TextWidget(title: '$title Afternoon,', size: fontSizeText);
  } else if (prevValues.evening) {
    return TextWidget(title: '$title Evening,', size: fontSizeText);
  } else {
    return const SizedBox();
  }
}
