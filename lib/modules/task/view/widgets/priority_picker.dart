import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/fileds.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/view/widgets/task_manager_modal.dart';

class PriorityPicker extends StatefulWidget {
  const PriorityPicker({
    required this.type,
    super.key,
  });

  final ManagerModal type;

  @override
  State<PriorityPicker> createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  final controller = Get.find<TaskManagerCubit>();

  final priorityList = <String>[
    'Baixa',
    'Média',
    'Alta',
  ];

  late int selectedPriority;

  @override
  void initState() {
    super.initState();

    if (widget.type == ManagerModal.creation) {
      selectedPriority = 1;
    } else {
      selectedPriority = priorityList.indexOf(controller.priority.text);
    }

    controller.priority.text = priorityList[selectedPriority];

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
