import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';
import '../../../controller/schedule_controller.dart';

class SaveButtonWidget extends StatelessWidget {
  SaveButtonWidget({super.key, required this.title});
  final ScheduleController scheduleController = Get.put(ScheduleController());
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        onPressed: () async {
          scheduleController.saveButton(title, context);
        },
        child: Obx(() {
          return scheduleController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: whiteColor,
                  ),
                )
              : Text(title);
        }),
      ),
    );
  }
}
