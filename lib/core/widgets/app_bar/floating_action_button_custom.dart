import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/modules/task-creation/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task-creation/view/widgets/task_manager_modal.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  const FloatingActionButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: EnumPaddings.x3),
      child: Material(
        shape: const CircleBorder(),
        color: AppColors.black.withOpacity(0.9),
        child: InkWell(
          onTap: () {
            showTaskManagerModal(context, ManagerModal.creation).then((value) {
              Get.find<TaskManagerCubit>().reset();
            });
          },
          splashColor: AppColors.black.withOpacity(0.9),
          customBorder: const CircleBorder(),
          child: const SizedBox(
            height: 70,
            width: 70,
            child: Center(
              child: Icon(
                CupertinoIcons.add,
                color: AppColors.white,
                size: 42,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
