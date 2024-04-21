import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/fileds.dart';
import 'package:task_hub/modules/task-creation/controller/task_manager_cubit.dart';

class DataPicker extends StatelessWidget {
  const DataPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskManagerCubit>();

    controller.date.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    controller.hour.text = DateFormat('HH:mm').format(DateTime.now());

    controller.checkButtonState();

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              showCupertinoDialogCustom(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime newDate) {
                    controller.date.text =
                        DateFormat('dd-MM-yyyy').format(newDate);
                    controller.checkButtonState();
                  },
                ),
                context: context,
              );
            },
            child: AbsorbPointer(
              child: TextFormFieldCustom(
                label: 'Data',
                controller: controller.date,
                requiredInput: true,
              ),
            ),
          ),
        ),
        const SizedBox(width: EnumPaddings.x2),
        Expanded(
          child: GestureDetector(
            onTap: () => showCupertinoDialogCustom(
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.time,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newTime) {
                  controller.hour.text = DateFormat('HH:mm').format(newTime);
                  controller.checkButtonState();
                },
              ),
              context: context,
            ),
            child: AbsorbPointer(
              child: TextFormFieldCustom(
                label: 'Hora',
                controller: controller.hour,
                requiredInput: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
