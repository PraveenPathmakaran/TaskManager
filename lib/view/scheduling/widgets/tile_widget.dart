import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/const/colors.dart';
import '../../../controller/schedule_controller.dart';
import '../../../widgets/widgets.dart';
import 'button_widget.dart';
import 'text_widget.dart';
import 'tick_button_widget.dart';

class TileWidget extends StatelessWidget {
  TileWidget({
    super.key,
    required this.index,
  });

  final int index;
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Obx(() {
            return Row(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //checked box
                TickButtonWidget(index: index),
                kWidth10,
                //text
                SizedBox(
                  width: 35,
                  child: TextWidget(
                    title: scheduleController.allData[index].week,
                    size: 13,
                  ),
                ),
                kWidth10,
                //buttons

                if (scheduleController.allData[index].isVisible)
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ButtonWidget(
                            title: 'Morning',
                            index: index,
                          ),
                        ),
                        kWidth10,
                        Expanded(
                          child: ButtonWidget(
                            title: 'Afternoon',
                            index: index,
                          ),
                        ),
                        kWidth10,
                        Expanded(
                          child: ButtonWidget(
                            title: 'Evening',
                            index: index,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Unavailable',
                      style: TextStyle(color: greyColor),
                    ),
                  )
              ],
            );
          })
        ],
      ),
    );
  }
}
