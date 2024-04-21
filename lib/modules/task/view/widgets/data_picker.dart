import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/fileds.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/view/widgets/task_manager_modal.dart';

class DataPicker extends StatefulWidget {
  const DataPicker({
    required this.type,
    super.key,
  });

  final ManagerModal type;

  @override
  State<DataPicker> createState() => _DataPickerState();
}

class _DataPickerState extends State<DataPicker> {
  final controller = Get.find<TaskManagerCubit>();
  late DateTime editDate;

  @override
  void initState() {
    super.initState();

    if (widget.type == ManagerModal.creation) {
      controller.date.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
      controller.hour.text = DateFormat('HH:mm').format(DateTime.now());
    } else {
      editDate = DateTime.parse(controller.date.text);
      controller.date.text = DateFormat('dd/MM/yyyy').format(editDate);
      controller.hour.text = DateFormat('HH:mm').format(editDate);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkButtonState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCreation = widget.type == ManagerModal.creation;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              showCupertinoDialogCustom(
                child: CupertinoDatePicker(
                  initialDateTime: isCreation ? DateTime.now() : editDate,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime newDate) {
                    controller.date.text =
                        DateFormat('dd/MM/yyyy').format(newDate);
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
                initialDateTime: isCreation ? DateTime.now() : editDate,
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
