import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/enums/paddings.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';

class FilterPicker extends StatefulWidget {
  const FilterPicker({
    super.key,
  });

  @override
  State<FilterPicker> createState() => _FilterPickerState();
}

class _FilterPickerState extends State<FilterPicker> {
  final controller = Get.find<TaskManagerCubit>();

  final filterList = <String>[
    'DATA MAIS ANTIGA',
    'DATA MAIS RECENTE',
    'MAIOR PRIORIDADE',
    'MENOR PRIORIDADE',
  ];

  late int selectedFilter;

  @override
  void initState() {
    super.initState();

    if (controller.state.filter != 0) {
      selectedFilter = controller.state.filter;
    } else {
      selectedFilter = 0;
      controller.setFilter(selectedFilter);
    }
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
            scrollController:
                FixedExtentScrollController(initialItem: selectedFilter),
            onSelectedItemChanged: (int selectedItem) {
              controller.setFilter(selectedItem);

              setState(() {
                selectedFilter = selectedItem;
              });
            },
            children: List<Widget>.generate(filterList.length, (int index) {
              return Center(child: Text(filterList[index]));
            }),
          ),
          context: context,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Filtro',
            style: AppTextStyles.body1.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(width: EnumPaddings.x1),
          SvgPicture.asset(
            height: 24,
            'assets/icons/filter.svg',
          ),
        ],
      ),
    );
  }
}
