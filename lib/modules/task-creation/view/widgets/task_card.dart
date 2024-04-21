import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/modules/task-creation/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task-creation/models/models.dart';
import 'package:task_hub/modules/task-creation/view/widgets/task_manager_modal.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    required this.index,
    super.key,
  });

  final TaskModel task;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskManagerCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: EnumPaddings.x1),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.black.withOpacity(0.1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: EnumPaddings.x2Half,
              vertical: EnumPaddings.x1,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectIcon(),
                const SizedBox(width: EnumPaddings.x2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              task.title,
                              style: AppTextStyles.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              task.description,
                              style: AppTextStyles.subtitle2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${task.onlyHour} - ${task.onlyDate}',
                              style: AppTextStyles.caption,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: EnumPaddings.x2),
                IconButton(
                  onPressed: () {
                    controller.loadTextEC(task, index);

                    showTaskManagerModal(context, ManagerModal.edition)
                        .then((value) {
                      Get.find<TaskManagerCubit>().reset();
                    });
                  },
                  icon: const Icon(Icons.edit),
                  iconSize: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectIcon() {
    switch (task.priority) {
      case 0:
        return Transform.rotate(
          angle: 90 * pi / 180,
          child: const Icon(
            Icons.double_arrow_rounded,
            color: AppColors.deepSkyBlue,
            size: 42,
          ),
        );
      case 1:
        return const Icon(
          CupertinoIcons.bars,
          size: 42,
          color: AppColors.warning,
        );
      case 2:
        return Transform.rotate(
          angle: -90 * pi / 180,
          child: const Icon(
            Icons.double_arrow_rounded,
            color: AppColors.error,
            size: 42,
          ),
        );
      default:
        return const Icon(
          CupertinoIcons.bars,
          size: 42,
          color: AppColors.warning,
        );
    }
  }
}
