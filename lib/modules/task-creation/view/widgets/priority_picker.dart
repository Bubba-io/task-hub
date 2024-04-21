import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/fileds.dart';
import 'package:task_hub/modules/task-creation/controller/task_manager_cubit.dart';

class PriorityPicker extends StatefulWidget {
  const PriorityPicker({super.key});

  @override
  State<PriorityPicker> createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  final controller = Get.find<TaskManagerCubit>();

  final priorityList = <String>[
    'Alta',
    'Média',
    'Baixa',
  ];

  int selectedPriority = 1;

  @override
  void initState() {
    super.initState();
    controller.priority.text = priorityList[1];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkButtonState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialogCustom(
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32,
            scrollController: FixedExtentScrollController(
              initialItem: selectedPriority,
            ),
            onSelectedItemChanged: (int selectedItem) {
              controller.priority.text = priorityList[selectedItem];

              setState(() {
                selectedPriority = selectedItem;
              });

              controller.checkButtonState();
            },
            children: List<Widget>.generate(priorityList.length, (int index) {
              return Center(child: Text(priorityList[index]));
            }),
          ),
          context: context,
        );
      },
      child: AbsorbPointer(
        child: TextFormFieldCustom(
          label: 'Prioridade',
          controller: controller.priority,
          requiredInput: true,
        ),
      ),
    );
  }
}
