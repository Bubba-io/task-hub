import 'package:flutter/cupertino.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/fileds.dart';

class DataPicker extends StatelessWidget {
  const DataPicker({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onDateTimeChanged: (DateTime newDate) {},
                ),
                context: context,
              );
            },
            child: const TextFormFieldCustom(
              label: 'Data',
              requiredInput: true,
              enabled: false,
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
                onDateTimeChanged: (DateTime newTime) {},
              ),
              context: context,
            ),
            child: const TextFormFieldCustom(
              label: 'Hora',
              requiredInput: true,
              enabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
