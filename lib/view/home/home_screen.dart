import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../controller/schedule_controller.dart';
import '../../widgets/widgets.dart';
import '../scheduling/widgets/save_button_widget.dart';
import '../scheduling/widgets/text_widget.dart';
import 'widgets/availability_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    final MediaQueryData screen = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () => scheduleController.onBackButtonPressed(context),
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Obx(() {
                return scheduleController.allData.isEmpty
                    ? progressIndicator
                    : SizedBox(
                        width: screen.size.width,
                        child: Column(
                          children: <Widget>[
                            const TextWidget(
                                title: 'Hi Jose you are available in\n',
                                size: fontSizeText),
                            Row(
                              children: [
                                availability('Sunday'),
                                preAvailability('Sunday')
                              ],
                            ),
                            Row(
                              children: [
                                availability('Monday'),
                                preAvailability('Monday')
                              ],
                            ),
                            Row(
                              children: [
                                availability('Tuesday'),
                                preAvailability('Tuesday')
                              ],
                            ),
                            Row(
                              children: [
                                availability('Wednesday'),
                                preAvailability('Wednesday')
                              ],
                            ),
                            Row(
                              children: [
                                availability('Thursday'),
                                preAvailability('Thursday')
                              ],
                            ),
                            Row(
                              children: [
                                availability('Friday'),
                                preAvailability('Friday')
                              ],
                            ),
                            Row(
                              children: [
                                availability('Saturday'),
                                preAvailability('Saturday')
                              ],
                            ),
                          ],
                        ),
                      );
              }),
              SaveButtonWidget(title: 'Schedule'),
            ],
          ),
        ),
      ),
    );
  }
}
