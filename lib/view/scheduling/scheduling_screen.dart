import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../controller/schedule_controller.dart';
import '../../widgets/widgets.dart';
import 'widgets/save_button_widget.dart';
import 'widgets/tile_widget.dart';

class SchedulingScreen extends StatelessWidget {
  SchedulingScreen({super.key});
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    scheduleController.getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        foregroundColor: blackColor,
        elevation: 0,
        title: const Text(
          'Set your weekly hours',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: Obx(
        () {
          return scheduleController.allData.isEmpty
              ? progressIndicator
              : Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == scheduleController.allData.length) {
                        return SaveButtonWidget(
                          title: 'Save',
                        );
                      }
                      return TileWidget(index: index);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemCount: scheduleController.allData.length + 1,
                  ),
                );
        },
      ),
    );
  }
}
