import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:task_hub/core/enums/enums.dart';
import 'package:task_hub/core/styles/styles.dart';
import 'package:task_hub/core/widgets/buttons/app_primary_button.dart';
import 'package:task_hub/core/widgets/dialogs/dialogs.dart';
import 'package:task_hub/modules/task/controller/task_manager_cubit.dart';
import 'package:task_hub/modules/task/models/models.dart';
import 'package:task_hub/modules/task/view/widgets/animations/task_done_animation.dart';

Future<void> showTaskViewModal(
  TaskModel taskModel,
  BuildContext context,
) async {
  final controller = Get.find<TaskManagerCubit>();

  await showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<TaskManagerCubit, TaskManagerState>(
        bloc: controller,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: EnumPaddings.x2Half),
                Container(
                  width: 80,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(
                      EnumPaddings.x1,
                    ),
                  ),
                ),
                const SizedBox(height: EnumPaddings.x3Half),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: EnumPaddings.x4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              taskModel.title,
                              style: AppTextStyles.h6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (taskModel.resolved) ...[
                            GestureDetector(
                              onTap: () async {
                                showAlertDialog(
                                  context: context,
                                  onAccept: () async {
                                    await controller.deleteTask();

                                    if (context.mounted) {
                                      context.pop();
                                    }
                                  },
                                  title: 'Alerta',
                                  content:
                                      '''Tem certeza que deseja excluir a tarefa?''',
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.trash_fill,
                                size: 26,
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${taskModel.onlyDate} - ${taskModel.onlyHour}',
                              style: AppTextStyles.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (taskModel.resolved) ...[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '''Data conclusão: ${taskModel.onlyDateResolved} - ${taskModel.onlyHourResolved}''',
                                style: AppTextStyles.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: EnumPaddings.x1),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              taskModel.description,
                              style: AppTextStyles.body1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: EnumPaddings.x2),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: taskModel.priorityColor.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: EnumPaddings.x1Half,
                            horizontal: EnumPaddings.x2Half,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [Text(taskModel.priorityString)],
                          ),
                        ),
                      ),
                      if (!taskModel.resolved) ...[
                        const SizedBox(height: EnumPaddings.x3),
                        AppPrimaryButton(
                          label: 'CONCLUIR TAREFA',
                          onTap: () async {
                            await controller.endTask();

                            if (context.mounted) {
                              context.pop();

                              await showDialog<Widget>(
                                barrierColor: AppColors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return const TaskDoneAnimation();
                                },
                              );
                            }
                          },
                        ),
                      ],
                      const SizedBox(height: EnumPaddings.x6),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
