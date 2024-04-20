import 'package:flutter/cupertino.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/core/widgets/fields/fileds.dart';

class PriorityPicker extends StatelessWidget {
  const PriorityPicker({super.key});

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
            scrollController: FixedExtentScrollController(),
            onSelectedItemChanged: (int selectedItem) {},
            children: List<Widget>.generate(5, (int index) {
              return Center(child: Text(index.toString()));
            }),
          ),
          context: context,
        );
      },
      child: const TextFormFieldCustom(
        label: 'Prioridade',
        requiredInput: true,
        enabled: false,
      ),
    );
  }
}
